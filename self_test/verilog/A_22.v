module moduleName (
);
    wire [8:0] test1,test2;
    // assign test1 = 8'bimoooo;
    assign test2 = {4'b1,4'b0};
    initial begin
        $display("%0d ; %0d",test1,test2);
    end
endmodule