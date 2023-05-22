/* $begin tinymain */
/*
 * tiny.c - A simple, iterative HTTP/1.0 Web server that uses the
 *     GET method to serve static and dynamic content.
 */
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "csapp.h"
// #include "homework/tiny_12_38/csapp.h"
#define ALWAYS_PREDICT_CONTINUE 0

void doit(int fd);
void read_requesthdrs(rio_t *rp);
int parse_uri(char *uri, char *filename, char *cgiargs);
void serve_static(int fd, char *filename, int filesize);
void get_filetype(char *filename, char *filetype);
void serve_dynamic(int fd, char *filename, char *cgiargs);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg,
                 char *longmsg);
void init_mutex(sem_t *log_mutex);

sem_t log_mutex;
int log_fd, filter_fd, proxy_client;
char *tmp, **filter_str_list;
#define FILTER_SIZE 50
#define ALL_MODE S_IROTH | S_IWOTH | S_IRGRP | S_IWGRP | S_IRUSR | S_IWUSR

void exit_handler(int sig) {
  printf("catch %s\n", strsignal(sig));
  Close(log_fd);
  Close(proxy_client);
  Free(tmp);
  Free(filter_str_list);
}

/*
reentrant
*/
void init_mutex(sem_t *log_mutex) { Sem_init(log_mutex, 0, 1); }

void read_filter(rio_t *rio_filter, char **filter_str_list, int *filter_fd) {
  char *buf = Malloc(MAXLINE + 1);
  int i = 0;
  while ((Rio_readlineb(rio_filter, buf, MAXLINE + 1)) > 0) {
    // printf("%s",buf);
    strcpy(filter_str_list[i], buf);
    i++;
    if (i == 50) {
      fprintf(stderr, "too many filters");
      exit(1);
    }
  }
  if (i == 0) {
    fprintf(stderr, "need filter list\n");
    exit(1);
  }
  Free(buf);
  Close(*filter_fd);
}

int main(int argc, char **argv) {
  int listenfd, connfd, max_line_with_newline = MAXLINE + 1;
  char hostname[MAXLINE], port[MAXLINE];
  socklen_t clientlen;
  struct sockaddr_storage clientaddr;
  rio_t rio_filter;
  struct stat stat_log;

  tmp = Malloc(max_line_with_newline);
  filter_str_list = Malloc(FILTER_SIZE * sizeof(char *));
  for (int i = 0; i < FILTER_SIZE; i++) {
    filter_str_list[i] = Calloc(max_line_with_newline, sizeof(char));
  }

  /* Check command line args */
  if (argc != 3) {
    fprintf(stderr, "usage: %s <proxy listening port> <proxy client port>\n",
            argv[0]);
    exit(1);
  }
  init_mutex(&log_mutex);
  if ((log_fd = open("log.txt", O_APPEND | O_CREAT, ALL_MODE)) == -1) {
    stat("log.txt", &stat_log);
    if (!(stat_log.st_mode & S_IRUSR)) {
      unix_error("unreadable");
    }
    unix_error("log fault: ");
  }
  if ((filter_fd = open("filter.txt", O_APPEND, ALL_MODE)) == -1) {
    unix_error("filter fault: ");
  }
  Rio_readinitb(&rio_filter, filter_fd);
  read_filter(&rio_filter, filter_str_list, &filter_fd);

  Signal(SIGINT, exit_handler);

  listenfd = Open_listenfd(argv[1]);
  proxy_client = Open_clientfd("localhost", argv[2]);
  printf("open proxy client: %d\n", proxy_client);
  clientlen = sizeof(struct sockaddr_storage);
  while (1) {
    connfd = Accept(listenfd, (SA *)&clientaddr,
                    &clientlen);  // line:netp:tiny:accept
    Getnameinfo((SA *)&clientaddr, clientlen, hostname, MAXLINE, port, MAXLINE,
                0);
    printf("Accepted connection from (%s, %s)\n", hostname, port);
    doit(connfd);   // line:netp:tiny:doit
    Close(connfd);  // line:netp:tiny:close
    printf("close %d with port %s\n", connfd, port);
  }
}
/* $end tinymain */

void read_requesthdrs_write(rio_t *rp, int *fd_ptr) {
  char buf[MAXLINE];
  int fd = *fd_ptr;
  Rio_readlineb(rp, buf, MAXLINE);
  Rio_writen(fd, buf, strlen(buf));
  while (strcmp(buf, "\r\n")) {  // line:netp:readhdrs:checkterm
    Rio_readlineb(rp, buf, MAXLINE);
    Rio_writen(fd, buf, strlen(buf));
  }
  return;
}

/*
 * doit - handle one HTTP request/response transaction
 */
/* $begin doit */
void doit(int fd) {
  int is_static, i;
  struct stat sbuf;
  char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
  char filename[MAXLINE], cgiargs[MAXLINE];
  rio_t rio_listen, rio_client_to_server;

  /* Read request line and headers */
  Rio_readinitb(&rio_listen, fd);
  Rio_readinitb(&rio_client_to_server, proxy_client);
  if (!Rio_readlineb(&rio_listen, buf, MAXLINE))  // line:netp:doit:readrequest
    return;
  printf("%s", buf);
  sscanf(buf, "%s %s %s", method, uri, version);  // line:netp:doit:parserequest
  if (strcasecmp(method, "GET")) {  // line:netp:doit:beginrequesterr
    clienterror(fd, method, "501", "Not Implemented",
                "Tiny does not implement this method");
    return;
  }  // line:netp:doit:endrequesterr

  P(&log_mutex);
  tmp = strcat(uri, "\n");
  write(log_fd, tmp, strlen(tmp));
  V(&log_mutex);
  printf("begin modify filter_str_list\n");

  for (i = 0; *filter_str_list[i] != 0; i++) {
#if ALWAYS_PREDICT_CONTINUE
    if (strcmp(uri, filter_str_list[i])) {
      continue;
    } else {
      return;
    }
#else
    if (!strcmp(uri, filter_str_list[i])) {
      printf("in filter list.\n");
      return;
    }
#endif
  }
  printf("write to server: %s\n", buf);
  Rio_writen(proxy_client, buf, strlen(buf));
  printf("to run read_requesthdrs_write\n");
  read_requesthdrs_write(&rio_listen,
                         &proxy_client);  // line:netp:doit:readrequesthdrs

  while ((Rio_readlineb(&rio_client_to_server, buf, MAXLINE)) > 0) {
    printf("write buf loop: %s\n", buf);
    Rio_writen(fd, buf, strlen(buf));
  }

  // if (stat(filename, &sbuf) < 0) {  // line:netp:doit:beginnotfound
  //   clienterror(fd, filename, "404", "Not found",
  //               "Tiny couldn't find this file");
  //   return;
  // }  // line:netp:doit:endnotfound

  // if (is_static) { /* Serve static content */
  //   if (!(S_ISREG(sbuf.st_mode)) ||
  //       !(S_IRUSR & sbuf.st_mode)) {  // line:netp:doit:readable
  //     clienterror(fd, filename, "403", "Forbidden",
  //                 "Tiny couldn't read the file");
  //     return;
  //   }
  //   serve_static(fd, filename, sbuf.st_size);  // line:netp:doit:servestatic
  // } else {                                     /* Serve dynamic content */
  //   if (!(S_ISREG(sbuf.st_mode)) ||
  //       !(S_IXUSR & sbuf.st_mode)) {  // line:netp:doit:executable
  //     clienterror(fd, filename, "403", "Forbidden",
  //                 "Tiny couldn't run the CGI program");
  //     return;
  //   }
  //   serve_dynamic(fd, filename, cgiargs);  // line:netp:doit:servedynamic
  // }
}
/* $end doit */

/*
 * read_requesthdrs - read HTTP request headers
 */
/* $begin read_requesthdrs */
void read_requesthdrs(rio_t *rp) {
  char buf[MAXLINE];

  Rio_readlineb(rp, buf, MAXLINE);
  printf("%s", buf);
  while (strcmp(buf, "\r\n")) {  // line:netp:readhdrs:checkterm
    Rio_readlineb(rp, buf, MAXLINE);
    printf("%s", buf);
  }
  return;
}
/* $end read_requesthdrs */

/*
 * parse_uri - parse URI into filename and CGI args
 *             return 0 if dynamic content, 1 if static
 */
/* $begin parse_uri */
int parse_uri(char *uri, char *filename, char *cgiargs) {
  char *ptr;

  if (!strstr(uri, "cgi-bin")) {
    /* Static content */              // line:netp:parseuri:isstatic
    strcpy(cgiargs, "");              // line:netp:parseuri:clearcgi
    strcpy(filename, ".");            // line:netp:parseuri:beginconvert1
    strcat(filename, uri);            // line:netp:parseuri:endconvert1
    if (uri[strlen(uri) - 1] == '/')  // line:netp:parseuri:slashcheck
      strcat(filename, "home.html");  // line:netp:parseuri:appenddefault
    return 1;
  } else { /* Dynamic content */  // line:netp:parseuri:isdynamic
    ptr = index(uri, '?');        // line:netp:parseuri:beginextract
    if (ptr) {
      strcpy(cgiargs, ptr + 1);
      *ptr = '\0';
    } else
      strcpy(cgiargs, "");  // line:netp:parseuri:endextract
    strcpy(filename, ".");  // line:netp:parseuri:beginconvert2
    strcat(filename, uri);  // line:netp:parseuri:endconvert2
    return 0;
  }
}
/* $end parse_uri */

/*
 * serve_static - copy a file back to the client
 */
/* $begin serve_static */
void serve_static(int fd, char *filename, int filesize) {
  int srcfd;
  char *srcp, filetype[MAXLINE], buf[MAXBUF];

  /* Send response headers to client */
  get_filetype(filename, filetype);     // line:netp:servestatic:getfiletype
  sprintf(buf, "HTTP/1.0 200 OK\r\n");  // line:netp:servestatic:beginserve
  sprintf(buf, "%sServer: Tiny Web Server\r\n", buf);
  sprintf(buf, "%sConnection: close\r\n", buf);
  sprintf(buf, "%sContent-length: %d\r\n", buf, filesize);
  sprintf(buf, "%sContent-type: %s\r\n\r\n", buf, filetype);
  Rio_writen(fd, buf, strlen(buf));  // line:netp:servestatic:endserve
  printf("Response headers:\n");
  printf("%s", buf);

  /* Send response body to client */
  srcfd = Open(filename, O_RDONLY, 0);  // line:netp:servestatic:open
  srcp = Mmap(0, filesize, PROT_READ, MAP_PRIVATE, srcfd,
              0);                  // line:netp:servestatic:mmap
  Close(srcfd);                    // line:netp:servestatic:close
  Rio_writen(fd, srcp, filesize);  // line:netp:servestatic:write
  Munmap(srcp, filesize);          // line:netp:servestatic:munmap
}

/*
 * get_filetype - derive file type from file name
 */
void get_filetype(char *filename, char *filetype) {
  if (strstr(filename, ".html"))
    strcpy(filetype, "text/html");
  else if (strstr(filename, ".gif"))
    strcpy(filetype, "image/gif");
  else if (strstr(filename, ".png"))
    strcpy(filetype, "image/png");
  else if (strstr(filename, ".jpg"))
    strcpy(filetype, "image/jpeg");
  else
    strcpy(filetype, "text/plain");
}
/* $end serve_static */

/*
 * serve_dynamic - run a CGI program on behalf of the client
 */
/* $begin serve_dynamic */
void serve_dynamic(int fd, char *filename, char *cgiargs) {
  char buf[MAXLINE], *emptylist[] = {NULL};

  /* Return first part of HTTP response */
  sprintf(buf, "HTTP/1.0 200 OK\r\n");
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Server: Tiny Web Server\r\n");
  Rio_writen(fd, buf, strlen(buf));

  if (Fork() == 0) { /* Child */  // line:netp:servedynamic:fork
    /* Real server would set all CGI vars here */
    setenv("QUERY_STRING", cgiargs, 1);  // line:netp:servedynamic:setenv
    Dup2(fd, STDOUT_FILENO);
    /* Redirect stdout to client */  // line:netp:servedynamic:dup2
    Execve(filename, emptylist, environ);
    /* Run CGI program */  // line:netp:servedynamic:execve
  }
  Wait(NULL);
  /* Parent waits for and reaps child */  // line:netp:servedynamic:wait
}
/* $end serve_dynamic */

/*
 * clienterror - returns an error message to the client
 */
/* $begin clienterror */
void clienterror(int fd, char *cause, char *errnum, char *shortmsg,
                 char *longmsg) {
  char buf[MAXLINE], body[MAXBUF];

  /* Build the HTTP response body */
  sprintf(body, "<html><title>Tiny Error</title>");
  sprintf(body,
          "%s<body bgcolor="
          "ffffff"
          ">\r\n",
          body);
  sprintf(body, "%s%s: %s\r\n", body, errnum, shortmsg);
  sprintf(body, "%s<p>%s: %s\r\n", body, longmsg, cause);
  sprintf(body, "%s<hr><em>The Tiny Web server</em>\r\n", body);

  /* Print the HTTP response */
  sprintf(buf, "HTTP/1.0 %s %s\r\n", errnum, shortmsg);
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Content-type: text/html\r\n");
  Rio_writen(fd, buf, strlen(buf));
  sprintf(buf, "Content-length: %d\r\n\r\n", (int)strlen(body));
  Rio_writen(fd, buf, strlen(buf));
  Rio_writen(fd, body, strlen(body));
}
/* $end clienterror */
