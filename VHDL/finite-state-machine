library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture my_fsm of fsm is
   type state_type is (STA,STB,STC);
   signal PS, NS : state_type;
begin
   sync_proc : process(CLK)
   begin
      if(rising_edge(CLK)) then
         if(RST = '1') then
            PS <= STA;
         else 
            PS <= NS;
         end if;
      end if;
   end process sync_proc;

   comb_proc: process(PS,In1)
   begin
      out1 <= '0';
      case PS is
         when STA => 
            out1 <= '0';
            if (in1 = '1') then
               NS <= STB;
            else
               NS <= STA;
            end if;
         when STB => 
            out1 <= '0';
            if (in1 = '1') then
               NS <= STB;
            else
               NS <= STC;
            end if;
         when STC => 
            out1 <= '1';
            if (in1 = '1') then
               NS <= STA;
            else
               NS <= STC;
            end if; 
         when others => 
            out1 <= '0';
            NS   <=  STA;
      end case;
   end process comb_proc;

end my_fsm;
