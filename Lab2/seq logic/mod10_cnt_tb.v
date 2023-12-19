`include "mod10_cnt.v"
`timescale 1ps/1ps

module mod10_cnt_tb;
  reg clk, rstn;
  wire [3:0] out;
  mod10_cnt cnt ( .clk(clk), .rstn(rstn), .out(out));
  always #10 clk = ~clk;
  
  initial
  begin
    $dumpvars;
    {clk, rstn} <= 0;
    #10 rstn <= 1;
    #450 $finish;
  end
endmodule
