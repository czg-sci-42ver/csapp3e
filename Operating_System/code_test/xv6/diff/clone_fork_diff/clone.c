int clone(void (*fcn)(void *, void *), void *arg1, void *arg2, void *stack) {
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if ((np = allocproc()) == 0) {
    return -1;
  }
  /*
  See https://www.computerworld.com/article/2585661/processes-and-threads.html#:~:text=A%20thread%20is%20like%20a,is%20created%20for%20each%20user.
  thread is one special child process which shares the same address space with the parent. So `np->pgdir = curproc->pgdir;`
  Also see 
  */
  np->pgdir = curproc->pgdir;  // same page table
  np->parent = curproc;
  *np->tf = *curproc->tf;

  np->tf->eip = (uint)fcn;  // eip register: instruction pointer
  // copy args to stack
  np->usp = stack;
  uint *sp = stack + PGSIZE;
  sp--;
  *sp = (uint)arg2;
  sp--;
  *sp = (uint)arg1;
  sp--;
  *sp = 0xffffffff;        // fake return PC
  np->tf->esp = (uint)sp;  // esp register: stack pointer

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for (i = 0; i < NOFILE; i++)
    if (curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);
  np->sz = curproc->sz;
  np->state = RUNNABLE;
  release(&ptable.lock);

  return pid;
}
