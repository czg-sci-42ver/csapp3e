int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      /*
      README
      > int wait() should wait for a child process that does not share the address space with this process.
      */
      if(p->parent != curproc || p->pgdir == curproc->pgdir)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        // free page table if this is last reference to it
        struct proc *q, *last_ref = p;
        for (q = ptable.proc; q < &ptable.proc[NPROC]; q++) {
          if (q != p && q->pgdir == p->pgdir) {
            /*
            Here 
            1. EMBRYO not taken in account because `allocproc` doesn't assign pgdir.
              Also it is only one intermediate state.
            2. SLEEPING, RUNNABLE, RUNNING are all processes which may be used in the future / in current.
            So should not free them.
            3. fork (new pgdir which won't overlap with others) and 
            zombie changed into UNUSED in join (pgdir = 0)
            So it is safe to free them.
            4. the "last reference" make `p->pgdir` safe to free.
            */
            if (q->state == UNUSED || q->state == ZOMBIE) {
              last_ref = q;
            } else {
              /*
              should not free them. See above "SLEEPING ...".
              */
              last_ref = 0;
              break;
            }
          }
        }
        if (last_ref == p){
          cprintf("free pgdir\n");
          freevm(p->pgdir);
        }
        p->pgdir = 0;
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
