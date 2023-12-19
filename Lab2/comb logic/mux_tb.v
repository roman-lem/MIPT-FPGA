`include "mux.v"
`timescale 1ps/1ps

module mux_tb();

  reg a, b, sel;
  wire c;
  integer i;
  mux mux ( .a(a), .b(b), .sel(sel), .c(c));
  initial
  begin
    $dumpvars;
    a <= 0;
    b <= 0;
    sel <= 0;
    for (i = 0; i < 8; i = i + 1)
    begin
      {a, b, sel} = i;
      #10;
    end
    $finish;
  end
endmodule
