`include "lshift.v"
`timescale 1ps/1ps

module lshift_tb;
  reg clk, rstn, d;
  wire [3:0] out;
  integer i;
  lshift lsh ( .d(d), .clk(clk), .rstn(rstn), .out(out));
  always #10 clk = ~clk;
  initial
  begin
    $dumpvars;
    {clk, rstn, d} <= 0;
    #10 rstn <= 1;
    for (i = 0; i < 20; i=i+1)
    begin
      @(posedge clk) d <= $random;
    end
    #10 $finish;
  end
endmodule
