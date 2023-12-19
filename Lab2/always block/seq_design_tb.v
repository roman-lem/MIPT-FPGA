`include "./tff.v"
`timescale 1ps/1ps

module tff_tb();

reg d = 1;
reg clk = 1;
reg res = 0;
wire out;

always #1 clk = ~clk;

tff tff(.d(d), .clk(clk), .rstn(res), .q(out));

initial begin
    $dumpvars;
    #10 d = 0;
    #10 d = 1; res = 1;
    #10 d = 0;
    #10 $finish;
end

endmodule
