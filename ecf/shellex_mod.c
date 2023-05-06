/* $begin shellmain */
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>

#include "csapp.h"
#define MAXARGS 128

/* Function prototypes */
void eval(char *cmdline);
int parseline(char *buf, char **argv);
int builtin_command(char **argv);
struct job_element {
  int job_id;
  int job_pid;
  char *cmd_str;
};
static int total_job = 0;
static struct job_element *jobs;
jmp_buf jmpbuf;

int bg; /* Should the job run in bg or fg? */

int main() {
  char cmdline[MAXLINE]; /* Command line */

  while (1) {
    /* Read */
    printf("> ");
    Fgets(cmdline, MAXLINE, stdin);
    if (feof(stdin)) exit(0);

    /* Evaluate */
    eval(cmdline);
  }
}
/* $end shellmain */

/* $begin eval */
/* eval - Evaluate a command line */
void eval(char *cmdline) {
  char *argv[MAXARGS]; /* Argument list execve() */
  char buf[MAXLINE];   /* Holds modified command line */
  pid_t pid;           /* Process id */

  strcpy(buf, cmdline);
  bg = parseline(buf, argv);
  if (argv[0] == NULL) return; /* Ignore empty lines */
  sigset_t mask, prev;
  Sigemptyset(&mask);
  Sigaddset(&mask, SIGINT);
  Sigaddset(&mask, SIGTSTP);

  if (!builtin_command(argv)) {
    if ((pid = Fork()) == 0) { /* Child runs user job */
      if (execve(argv[0], argv, environ) < 0) {
        printf("%s: Command not found.\n", argv[0]);
        exit(0);
      }
    }

    /* Parent waits for foreground job to terminate */
    if (!bg) {
      int status;
      if (waitpid(pid, &status, 0) < 0) unix_error("waitfg: waitpid error");
    } else
      printf("%d %s", pid, cmdline);
    if ((pid && bg)) {
      if (sigsetjmp(jmpbuf, 1)) {
        for (int i = 0; i < sizeof(jobs); i++) {
            int target_pid = (jobs + i)->job_pid;
            kill(target_pid, SIGCONT);
            printf("continue %d", target_pid);
        }
      }
      Sigprocmask(SIG_BLOCK, &mask, &prev);
      *jobs->cmd_str = *argv[0];
      (*jobs).job_id = total_job;
      jobs++;
      total_job++;
      printf("block in pid: %d", pid);
    }
  }
  return;
}

/* If first arg is a builtin command, run it and return true */
int builtin_command(char **argv) {
  if (!strcmp(argv[0], "quit")) /* quit command */
    exit(0);
  if (!strcmp(argv[0], "jobs")) {
    printf("jobs:");
    for (int i = 0; i < sizeof(jobs_list); i++) {
      printf("job %d: %s\n", i, *(jobs_list + i));
    }
  }
  if (!strcmp(argv[0], "bg")) {
    if (argv[1]) {
      int target_pid_jid = atoi(argv[1]);
      for (int i = 0; i < sizeof(jobs); i++) {
        if ((jobs + i)->job_id == target_pid_jid ||
            (jobs + i)->job_pid == target_pid_jid) {
          int target_pid = (jobs + i)->job_pid;
          kill(target_pid, SIGCONT);
          printf("continue %d", target_pid);
        }
      }
    } else {
      Sio_error("need one param");
    }
    siglongjmp(jmpbuf, 1);
  }
  if (!strcmp(argv[0], "fg")) {
    if (argv[1]) {
      int target_pid_jid = atoi(argv[1]);
      for (int i = 0; i < sizeof(jobs); i++) {
        if ((jobs + i)->job_id == target_pid_jid ||
            (jobs + i)->job_pid == target_pid_jid) {
          int target_pid = (jobs + i)->job_pid;
          kill(target_pid, SIGCONT);
          printf("continue %d", target_pid);
        }
      }
    } else {
      Sio_error("need one param");
    }
    if (waitpid(pid, &status, 0) < 0) unix_error("waitfg: waitpid error");
  }
  if (!strcmp(argv[0], "&")) /* Ignore singleton & */
    return 1;
  return 0; /* Not a builtin command */
}
/* $end eval */

/* $begin parseline */
/* parseline - Parse the command line and build the argv array */
int parseline(char *buf, char **argv) {
  char *delim; /* Points to first space delimiter */
  int argc;    /* Number of args */
  int bg;      /* Background job? */

  buf[strlen(buf) - 1] = ' ';   /* Replace trailing '\n' with space */
  while (*buf && (*buf == ' ')) /* Ignore leading spaces */
    buf++;

  /* Build the argv list */
  argc = 0;
  while ((delim = strchr(buf, ' '))) {
    argv[argc++] = buf;
    *delim = '\0';
    buf = delim + 1;
    while (*buf && (*buf == ' ')) /* Ignore spaces */
      buf++;
  }
  argv[argc] = NULL;

  if (argc == 0) /* Ignore blank line */
    return 1;

  /* Should the job run in the background? */
  if ((bg = (*argv[argc - 1] == '&')) != 0) {
    argv[--argc] = NULL;
  }

  return bg;
}
/* $end parseline */
