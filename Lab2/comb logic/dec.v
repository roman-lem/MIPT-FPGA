module dec ( input en,
               input [3:0] in,
               output reg [15:0] out);
  always @ (en or in)
  begin
    out = en ? 16'b1 << in: 16'b0;
  end
endmodule
