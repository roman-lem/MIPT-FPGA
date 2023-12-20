`include "nco_dither_lsfr.v"
module NCO (clk, rst, step, out);

  parameter STEP_WIDTH = 16; // integer part of of phase accumulator
  parameter ADDR_WIDTH = 8; // integer part of of phase accumulator
  parameter LUT_WIDTH = 16;

  localparam FRACT_WIDTH = STEP_WIDTH-ADDR_WIDTH; // fractional part of phase accumulator

  input clk;
  input rst;
  input [STEP_WIDTH-1:0] step; // defines sinwave frequency
  output reg signed [LUT_WIDTH-1:0] out;

  reg signed [LUT_WIDTH-1:0] LUT [2**ADDR_WIDTH-1:0];
  reg [STEP_WIDTH+FRACT_WIDTH-1:0] ph_accum;


  // RTL code for phase accumulator'

  // dither generation
  wire [3:0]dither;
  //assign dither = 0; // replace with line by LSFR module instantiation to get dither value
  nco_dither_lsfr #(.OUT_SIZE(4)) lsfr(.clk(clk), .rst(rst), .out(dither));
  always @(posedge clk)
  begin
    if (rst)
      ph_accum <= 0;
    else
      ph_accum <= ph_accum + step + dither;
  end


  // generate SIN LUT contents
  localparam PI = $atan(1)*4.0;
  // Potentially here can be troubles in 'initial'
  // if yes, then generate file from other lang and use `$readmemb` or `$readmemh`

  initial begin: loot_gen
    real phase;
    for (phase = 0; phase < 2.0**ADDR_WIDTH; phase = phase+1.0) begin
      LUT[$rtoi(phase)] = $floor(($sin(2*PI * phase / 2.0**ADDR_WIDTH)) * 2**(LUT_WIDTH-2) );
    end
  end
  
  // addr generation
  reg [ADDR_WIDTH-1:0] addr;

  always @(posedge clk)
  begin
    if (rst)
      addr <= 0;
    else
      addr <= ph_accum [ADDR_WIDTH+FRACT_WIDTH-1:FRACT_WIDTH];
  end


  // LUT ouput generation from ROM
  always @ (posedge clk)
  begin
    out <= LUT[addr];
  end

endmodule
