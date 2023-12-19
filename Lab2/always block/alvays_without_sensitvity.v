`timescale 1ps/1ps

module without_sens_tb ();

  reg clk = 0;

  always #10 clk = ~clk;

  initial
    begin
      $dumpvars;
      #100 $finish;
    end

endmodule
