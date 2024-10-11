LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
PORT( Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

architecture my_alu of ALU is 
begin
    Y <= A          when (op_code = "000") else
         A + B      when (op_code = "001") else
         A - B      when (op_code = "010") else
         A AND B    when (op_code = "011") else
         A OR B     when (op_code = "100") else
         A + 1      when (op_code = "101") else
         A -1       when (op_code = "110") else
         B          when (op_code = "111");
end my_alu;
