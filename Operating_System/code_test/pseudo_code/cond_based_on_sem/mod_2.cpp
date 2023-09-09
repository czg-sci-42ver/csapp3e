class CV {
	Semaphore s, x;
	Lock m;
	int waiters = 0;
	Semaphore h;
	public CV(Lock m) {
		// Constructor
		this.m = m;
		s = new Semaphore(); s.count = 0; s.limit = 999999;
		x = new Semaphore(); x.count = 1; x.limit = 1;
		h = new Semaphore(); h.count = 0; h.limit = 999999;
	}
	public void Wait() {
		// Pre-condition: this thread holds “m”
		x.P(); {
			waiters++;
		} x.V();
		m.Release();
		(1) —
			s.P();
		h.V();
		m.Acquire();
	}
	public void Signal() {
		x.P(); {
			if (waiters > 0) { waiters--; s.V(); h.P(); }
		} x.V();
	}
	public void Broadcast() {
		x.P(); {
			for (int i = 0; i < waiters; i++) s.V();
			while (waiters > 0) { waiters--; h.P(); }
		} x.V();
	}
}
