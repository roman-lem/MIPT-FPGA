`include "fa.v"
`timescale 1ps/1ps

module fa_tb();
  reg a, b, cin;
  wire sum, cout;
  integer i;
  fa u0 ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  initial
  begin
    $dumpvars;
    a <= 0;
    b <= 0;
    for (i = 0; i < 8; i = i + 1)
    begin
      {a, b, cin} = i;
      #10;
    end
    $finish;
  end
endmodule
