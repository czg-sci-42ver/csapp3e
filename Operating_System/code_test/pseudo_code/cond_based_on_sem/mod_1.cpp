class CV {
	Semaphore s, x;
	Lock m;
	int waiters = 0;
	public CV(Lock m) {
		// Constructor
		this.m = m;
		s = new Semaphore(); s.count = 0; s.limit = 1;
		x = new Semaphore(); x.count = 1; x.limit = 1;
	}
	public void Wait() {
		// Pre-condition: this thread holds “m”
		x.P(); {
			waiters++;
		} x.V();
		m.Release();
		(1) —
			s.P();
		m.Acquire();
	}
	public void Signal() {
		x.P(); {
			if (waiters > 0) { waiters--; s.V(); }
		} x.V();
	}
	public void Broadcast() {
		x.P(); {
			while (waiters > 0) { waiters--; s.V(); }
		} x.V();
	}
}
