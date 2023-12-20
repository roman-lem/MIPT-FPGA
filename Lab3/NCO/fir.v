module fir(clk, rst, in, out);
    parameter WIDTH = 16;

    input [WIDTH-1:0] in;
    input clk, rst;
    output reg [WIDTH-1:0] out;

    reg [WIDTH-1:0] hold1 = 0;
    reg [WIDTH-1:0] hold2 = 0;

    always @(posedge clk) begin
        if(rst) begin
            hold1 = 0;
            hold2 = 0;
        end
        else begin
            out = hold1/3 + hold2/3 + in/3;
            hold2 = hold1;
            hold1 = in;
        end
    end
endmodule