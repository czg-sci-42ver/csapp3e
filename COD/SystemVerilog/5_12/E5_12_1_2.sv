`timescale 1ns/1ns
package cache_def;
  // data structures for cache tag &data
  parameter int TAGMSB = 31;  //tag msb
  parameter int TAGLSB = 14;  //tag lsb
  
  // timeunit 1ns; timeprecision 1ns;

  //data structure for cache tag
  /*
  if valid -> has tag, not valid -> no tag
  if dirty -> vadid, not dirty -> v... / not valid.
  So has 3 conditions(v&d,v&not_d,not_v&not_d).

  ignore this line: write has one more condition conflict miss (one special case of 'valid & dirty'.)

  read hit dirty / hit clean use the same workflow. See below write hit dirty...
  */
  typedef struct packed {
    bit valid;
    //valid bit
    bit dirty;
    //dirty bit
    bit [TAGMSB : TAGLSB] tag;
    //tag bits
  } cache_tag_type;
  //data structure for cache memory r equest
  /*
  write clean miss is similar to read clean miss
  1. `if (tag_read.valid == 1'b0 || tag_read.dirty == 1'b0)` -> write tag and then allocate 
  2. fetch mem by `data_write = mem_data.data;` and write to cache in `dm_cache_data`

  write hit dirty (not write-back but upadte the cache block) is same as hit clean (hit implies tag match) because the tag match and then run `if (cpu_req.addr[TAGMSB : TAGLSB] == tag_read.tag && tag_read.valid) begin`
  it will be `vstate = idle;` after letting `dm_...` update data.
  */
  typedef struct packed {
    bit [9:0] index;
    //10-bit index
    bit we;
    //write enable
  } cache_req_type;
  // 128-bit cache line data
  typedef bit [127 : 0] cache_data_type;
  // data structures for CPU<->Cache controller interface
  // CPU request (CP U->cac he contro ll er)
  typedef struct packed {
    bit [31 : 0] addr;
    //32-b i t request addr
    bit [31:0] data;
    //32-bit req uest data (used when write)
    bit rw;
    //request type : 0 = read . 1 = write
    bit valid;
    //request is valid
  } cpu_req_type;
  // Cache result (cache control l er->cpu)
  typedef struct packed {
    bit [31 : 0] data;
    //32-b i t data
    bit ready;
    //resu l t is ready
  } cpu_result_type;
  // data structures for cache controller<->memory i nterface
  // memory request (cac he controller->memory)
  typedef struct packed {
    bit [31 : 0] addr;
    //request byte addr
    bit [127:0] data;
    //128- bi t request data (used when write)
    bit rw;
    //request type : 0 = read . 1 = write
    bit valid;
    //reques t is valid
  } mem_req_type;
  // memory controller response (memory-> cache controller)
  typedef struct packed {
    cache_data_type data;
    //128-b it read ba ck data
    bit ready;
    //data is ready
  } mem_data_type;
endpackage
