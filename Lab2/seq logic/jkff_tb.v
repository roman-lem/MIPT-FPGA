`include "jkff.v"
`timescale 1ps/1ps

module jkff_tb;

  reg j, k, rstn, clk;
  wire q;
  integer i;
  reg [2:0] dly;
  always #10 clk = ~clk;

  jkff jkff ( .j(j), .k(k), .clk(clk), .rstn(rstn), .q(q));

  initial
  begin
    $dumpvars;
    {j, k, rstn, clk} <= 0;
    #10 rstn <= 1;
    for (i = 0; i < 10; i = i+1)
    begin
      dly = $random;
      #(dly) j <= $random;
      #(dly) k <= $random;
    end
    #20 $finish;
  end
endmodule
