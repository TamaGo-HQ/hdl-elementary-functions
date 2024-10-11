LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture my_ram of RAM128_32 is
signal storage : STD_LOGIC_VECTOR(4095 DOWNTO 0);
SIGNAL add_int : INTEGER RANGE 0 TO 127;
--SIGNAL out_signal : STD_LOGIC_VECTOR (31 DOWNTO 0);
begin 
	sync_proc: process(clock)
    begin
        if (rising_edge(clock)) then
			add_int <= to_integer(unsigned(address));
            if(wren = '1') then
                storage((add_int * 32) + 31 DOWNTO (add_int * 32)) <= data;
			end if;
        end if;
    end process sync_proc;
q <= storage((add_int * 32) + 31 DOWNTO (add_int * 32));
end my_ram;
