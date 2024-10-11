module RAM128x32 
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );

  reg [(Data_width-1):0] RAM [2^(Addr_width-1):0];  // Creates an array named fifo with 128 elements, each 32 bits wide
 
  always @(posedge clk)
  begin
    if (we == 1'b1)
    RAM[address] = d;
  end 

  assign q = RAM[address];

endmodule
