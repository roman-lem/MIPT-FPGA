module tff (input d,
              clk,
              rstn,
              output reg q);
  always @ (posedge clk or negedge rstn)
  begin
    if (!rstn)
      q <= 0;
    else
      if (d)
        q <= ~q;
      else
        q <= q;
  end
endmodule
