module mux_Nto1 #(parameter N = 5) (
    input [N-1:0] vec,
    input [15:0] addr,

    output wire res
);

assign res = vec[addr];

endmodule