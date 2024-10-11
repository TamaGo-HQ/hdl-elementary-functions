LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity AAC2M2P1 is port (                 	
   CP: 	    in  std_logic; 	                    -- clock
   SR:      in  std_logic;                      -- Active low, synchronous reset
   P:       in  std_logic_vector(3 downto 0);   -- Parallel input
   PE:      in  std_logic;                      -- Parallel Enable (Load)
   CEP:     in  std_logic;                      -- Count enable parallel input
   CET:     in  std_logic;                      -- Count enable trickle input
   Q:       out std_logic_vector(3 downto 0);            			
   TC:      out std_logic                       -- Terminal Count
);            		
end AAC2M2P1;

architecture bin_counter of AAC2M2P1 is
signal nextQ : unsigned(3 downto 0) := (others => '0'); 

begin
    sync_proc: process(CP)
    begin
        if (rising_edge(CP)) then
            if(SR = '0') then
                nextQ  <= "0000";
            else if(PE = '0') then
                    nextQ <= unsigned(P);
                 else if (CEP = '1') and (CET = '1') then
                            nextQ <= nextQ + 1;
                      end if;
                 end if;    
            end if;
        end if;
    end process sync_proc;

 -- Output assignments
Q <= std_logic_vector(nextQ);

-- Terminal count logic (High when count reaches 15)
TC <= '1' when nextQ = "1111" and CET = '1' else '0';

end bin_counter;
