parameter CYCLE = 1;
parameter CPU_REQ_SIZE = ('b1<<(2+1))*4;
parameter STATE_SIZE = 4;
parameter FINISH_TIME = (CPU_REQ_SIZE)*CYCLE;
// typedef cpu_req_type cpu_req_list [CPU_REQ_SIZE:0];