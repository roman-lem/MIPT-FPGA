module mod10_cnt( input clk,
                    input rstn,
                    output reg[3:0] out);
  always @ (posedge clk)
  begin
    if (!rstn)
    begin
      out <= 4'b0;
    end
    else
    begin
      if (out == 10)
        out <= 4'b0;
      else
        out <= out + 4'b1;
    end
  end
endmodule
