module for_loop;
  initial begin
    $display("-----------------------------------------------------------------");
    for (int i = 0; i < 5; i++) $display("\t Value of i = %0d", i);
    $display("-----------------------------------------------------------------");
  end
endmodule
