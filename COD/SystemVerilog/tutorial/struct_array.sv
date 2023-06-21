/* verilator lint_off SHORTREAL */
module struct_tb;
  typedef struct {
    int a;
    shortreal b;
  } ab;
  ab c_inst;
  initial begin
    ab abarr[1:0] = '{'{1, 1.0}, '{2, 2.0}};
    abarr[0] = '{1, 1.0};
    c_inst = '{a: 0, b: 0.0};
    // ab abarr[0:0] = '{'{2, 2.0}};
  end
endmodule
