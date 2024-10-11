module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output reg [3:0]Q,        // Parallel Output 	
    output reg RCO            // Ripple Carry Output (Terminal Count)
)
; 


always @ (posedge CLK)
begin
    if (!CLR_n)
        Q <= 0;
        else if (LOAD_n == 0) 
        Q <= D;
        else if (ENT == 1 && ENP == 1)
        Q <= Q + 1;
end

always @(*) begin
    if (Q == 4'b1111 && ENT) 
        RCO = 1'b1;    // Set RCO when counter reaches maximum and ENT is high
    else 
        RCO = 1'b0;
end
endmodule
