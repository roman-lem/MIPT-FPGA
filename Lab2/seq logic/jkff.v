module jkff ( input j,
                input k,
                input rstn,
                input clk,
                output reg q);
  always @ (posedge clk or negedge rstn)
  begin
    if (!rstn)
    begin
      q <= 0;
    end
    else
    begin
      q <= (j & ~q) | (~k & q);
    end
  end
endmodule
