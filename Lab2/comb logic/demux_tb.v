`include "demux.v"
`timescale 1ps/1ps

module demux_tb();

  reg f;
  reg [1:0] sel;
  wire a, b, c, d;
  integer i;

  demux dem ( .f(f), .sel(sel), .a(a), .b(b), .c(c), .d(d));
  initial
  begin
    $dumpvars;
    f <= 0;
    sel <= 0;
    for (i = 0; i < 8; i = i + 1)
    begin
      {f, sel} = i;
      #10;
    end
    $finish;
  end
endmodule
