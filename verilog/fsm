module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);

parameter state0=0, state1=1, state2=2;
reg [1:0] state, nxt_st;

always @(posedge CLK)
begin
  if (RST == 0)
  state <= state0;
  else
  state <= nxt_st;
end

always @(state, In1)
begin
  case(state)

    state0 : begin
      Out1 <= 0;
      if (In1 == 1) 
      nxt_st <= state1;
      else
      nxt_st <= state0;
    end

    state1 : begin
      Out1 <= 0;
      if (In1 == 1) 
      nxt_st <= state1;
      else
      nxt_st <= state2;
    end

    state2 : begin
      Out1 <= 1;
      if (In1 == 1) 
      nxt_st <= state0;
      else
      nxt_st <= state2;
    end

    default : begin
      Out1 <= 0;
      nxt_st <= state0;
    end
  endcase
end
endmodule
