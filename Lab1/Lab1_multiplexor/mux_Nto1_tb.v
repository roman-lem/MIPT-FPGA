`include "mux_Nto1.v"
`timescale 1ps/1ps

module mux_Nto1_tb ();

reg [6:0] test_vec = 0;
reg [15:0] addr = 0;
wire out;
integer i;

mux_Nto1 #(.N(7)) mux_7to1 (.vec(test_vec), .addr(addr), .res(out));

initial begin
    $dumpvars;

    for(i = 0; i < 7; i = i+1)begin
        #10
        test_vec = 7'h0;
        test_vec[i] = 1;
        addr = i;
    end
    #10
    $finish;
end

endmodule