`include "ha.v"
`timescale 1ps/1ps

module ha_tb();

  reg a, b;
  wire sum, cout;
  integer i;

  ha ha ( .a(a), .b(b), .sum(sum), .cout(cout));
  initial
  begin
    $dumpvars;

    a <= 0;
    b <= 0;

    for (i = 0; i < 4; i = i + 1)
    begin
      {a, b} = i;
      #10;
    end
    $finish;
  end
endmodule
