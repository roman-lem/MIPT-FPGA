`include "combo.v"
`timescale 1ps/1ps

module combo_tb();

reg [3:0]inp = 0;
assign a = inp[0];
assign b = inp[1];
assign c = inp[2];
assign d = inp[3];
wire o;
integer i;

combo combo(.a(a), .b(b), .c(c), .d(d), .o(o));

initial begin 
    $dumpvars;
    for(i = 0; i < 16; i = i+1)begin 
        #2 inp = inp+1;
    end
    #2 $finish;
end

endmodule