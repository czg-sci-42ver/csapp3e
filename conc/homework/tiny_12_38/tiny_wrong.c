/* $begin tinymain */
/*
 * tiny.c - A simple, iterative HTTP/1.0 Web server that uses the
 *     GET method to serve static and dynamic content.
 */
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#include "csapp.h"
#include "sbuf.h"

void doit(int fd);
void read_requesthdrs(rio_t *rp);
int parse_uri(char *uri, char *filename, char *cgiargs);
void serve_static(int fd, char *filename, int filesize);
void get_filetype(char *filename, char *filetype);
void serve_dynamic(int fd, char *filename, char *cgiargs);
void clienterror(int fd, char *cause, char *errnum, char *shortmsg,
                 char *longmsg);

#define SBUFSIZE 16
#define MAX_THREAD 32

sbuf_t sbuf;

void *thread(void *vargp) {
  // Pthread_detach(pthread_self());
  while (1) {
    int connfd = sbuf_remove(&sbuf); /* Remove connfd from buffer */
    printf("to read %d\n", connfd);
    doit(connfd);  // line:netp:tiny:doit
    printf("to close %d\n", connfd);
    Close(connfd);  // line:netp:tiny:close
    printf("has closed %d", connfd);
  }
}

int main(int argc, char **argv) {
  int listenfd, connfd;
  char hostname[MAXLINE], port[MAXLINE];
  socklen_t clientlen;
  struct sockaddr_storage clientaddr;
  int i, buf_cnt;
  pthread_t *tid = Malloc(sizeof(pthread_t) * MAX_THREAD);

  /* Check command line args */
  if (argc != 3) {
    fprintf(stderr, "usage: %s <port> <threads>\n", argv[0]);
    exit(1);
  }
  int threads = atoi(argv[2]);
  if (threads > MAX_THREAD / 2) {
    fprintf(stderr, "too big thread arg");
    exit(1);
  }
  sbuf_init(&sbuf, SBUFSIZE);

  for (i = 0; i < threads; i++) /* Create worker threads */
    Pthread_create(&tid[i], NULL, thread, NULL);

  listenfd = Open_listenfd(argv[1]);
  clientlen = sizeof(clientaddr);
  while (1) {
    connfd = Accept(listenfd, (SA *)&clientaddr,
                    &clientlen);  // line:netp:tiny:accept
    sbuf_insert(&sbuf, connfd);   /* Insert connfd in buffer */
    P(&sbuf.mutex);
    buf_cnt = sbuf.rear - sbuf.front;
    if (buf_cnt == sbuf.n) {
      threads *= 2;
      if (threads > MAX_THREAD) {
        fprintf(stderr, "unable to scale");
        exit(1);
      }
      for (i = threads; i < threads * 2; i++) /* Create worker threads */
        Pthread_create(&tid[i], NULL, thread, NULL);
    } else if (buf_cnt == 0) {
      fprintf(stdout, "buffer empty");
      if (threads < 2) {
        fprintf(stdout, "thread is in lack");
        V(&sbuf.mutex);
        continue;
      }
      for (i = threads / 2; i < threads; i++) /* Create worker threads */
      {
        printf("threads: %d\n", threads);
        fprintf(stdout, "kill 0x%lx\n", tid[i]);
        /*
        need cancel thread because thread itself not exit automatically.
        */
        Pthread_join(tid[i], NULL);
      }
    }
    V(&sbuf.mutex);
  }
}
/* $end tinymain */

/*
 * doit - handle one HTTP request/response transaction
 */
/* $begin doit */
void doit(int fd) {
  int is_static;
  struct stat sbuf;
  char buf[MAXLINE], method[MAXLINE], uri[MAXLINE], version[MAXLINE];
  char filename[MAXLINE], cgiargs[MAXLINE];
  rio_t rio;

  /* Read request line and headers */
  Rio_readinitb(&rio, fd);
  if (!Rio_readlineb(&rio, buf, MAXLINE))  // line:netp:doit:readrequest
    return;
  printf("%s", buf);
  sscanf(buf, "%s %s %s", method, uri, version);  // line:netp:doit:parserequest
  if (strcasecmp(method, "GET")) {  // line:netp:doit:beginrequesterr
    clienterror(fd, method, "501", "Not Implemented",
                "Tiny does not implement this method");
    return;
  }                        // line:netp:doit:endrequesterr
  read_requesthdrs(&rio);  // line:netp:doit:readrequesthdrs

  /* Parse URI from GET request */
  is_static = parse_uri(uri, filename, cgiargs);  // line:netp:doit:staticcheck
  if (stat(filename, &sbuf) < 0) {  // line:netp:doit:beginnotfound
    clienterror(fd, filename, "404", "Not found",
                "Tiny couldn't find this file");
    return;
  }  // line:netp:doit:endnotfound

  if (is_static) { /* Serve static content */
    if (!(S_ISREG(sbuf.st_mode)) ||
        !(S_IRUSR & sbuf.st_mode)) {  // line:netp:doit:readable
      clienterror(fd, filename, "403", "Forbidden",
                  "Tiny couldn't read the file");
      return;
    }
    serve_static(fd, filename, sbuf.st_size);  // line:netp:doit:servestatic
  } else {                                     /* Serve dynamic content */
    if (!(S_ISREG(sbuf.st_mode)) ||
        !(S_IXUSR & sbuf.st_mode)) {  // line:netp:doit:executable
      clienterror(fd, filename, "403", "Forbidden",
                  "Tiny couldn't run the CGI program");
      return;
    }
    serve_dynamic(fd, filename, cgiargs);  // line:netp:doit:servedynamic
  }
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
