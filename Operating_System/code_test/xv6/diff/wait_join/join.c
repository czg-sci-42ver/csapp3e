int join(void **stack) {
  struct proc *p;
  int havethread, pid;
  struct proc *curproc = myproc();

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited thread.
    havethread = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      /*
      This call waits for a child thread that shares the address space with the calling process to exit.
      */
      if(p->parent != curproc || p->pgdir != curproc->pgdir)
        continue;
      havethread = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        *stack = p->usp;
        kfree(p->kstack);
        p->kstack = 0;
        /*
        IMHO, it is freed by the shell when freeing its parent instead of wait
        See "free pgdir"
        */
        // freevm(p->pgdir);  free it at wait()
        /*
        Similar to wait does.
        */
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        p->usp = 0;
        release(&ptable.lock);
        /*
        It returns the PID of waited-for child or -1 if none.
        */
        return pid;
      }
    }

    // No point waiting if we don't have any thread.
    if(!havethread || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for thread to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
