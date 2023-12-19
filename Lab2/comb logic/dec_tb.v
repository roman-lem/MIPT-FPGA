`include "dec.v"
`timescale 1ps/1ps

module tb;

  reg en;
  reg [3:0] in;
  wire [15:0] out;
  integer i;
  dec dec ( .en(en), .in(in), .out(out));

  initial
  begin
    $dumpvars;
    en = 0;
    in = 0;
    for (i = 0; i < 32; i = i + 1)
    begin
      {en, in} = i;
      #10;
    end
    $finish;
  end
endmodule
