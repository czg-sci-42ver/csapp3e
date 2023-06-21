`include "./E5_12_4.sv"
module view_var (
    input cpu_req_type cpu_req,
    input cache_req_type tag_req,
    input cache_tag_type tag_read,
    input cache_tag_type tag_write,
    output wire [TAGMSB-TAGLSB:0] cpu_req_tag
);
  wire rw, we, cpu_req_valid,tag_read_valid;
  wire [9:0] index;
  wire [TAGMSB : TAGLSB] tag_write_tag, tag_read_tag;
  wire [31:0] cpu_req_data;

  always @(cpu_req_tag != tag_read_tag) begin
    $display("cpu_req_tag: %0b; tag_read_tag: %0b",cpu_req_tag,tag_read_tag);
  end 
  assign cpu_req_tag = cpu_req.addr[TAGMSB : TAGLSB];
  assign we = tag_req.we;
  assign index = tag_req.index;
  assign rw = cpu_req.rw;
  assign cpu_req_valid = cpu_req.valid;
  assign tag_write_tag = tag_write.tag;
  assign tag_read_tag = tag_read.tag;
  assign cpu_req_data = cpu_req.data;
  assign tag_read_valid = tag_read.valid;
endmodule
