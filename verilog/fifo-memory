module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren
	);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [7:0] wrptr, rdptr;
	wire [7:0] wr_cnt, rd_cnt;

  always @(clk)
  begin
    if (rst == 1) begin
      rdptr = 3'b000;
      wrptr = 3'b000;
    end
    
    if(RdPtrClr == 1)
    rdptr = 3'b000;
    else if(RdInc == 1)
    rdptr = rdptr + 3'b001;

    if(WrPtrClr == 1)
    wrptr = 3'b000;
    else if(WrInc == 1)
    wrptr = wrptr + 3'b001;

    if(wren == 1)
    fifo_array[wrptr] = DataIn;
  end
 
  always @(*)
  begin
  if(rden == 1)
  DataOut = fifo_array[rdptr];
  else
  DataOut = 9'bZZZZZZZZZ;
  end

endmodule 
