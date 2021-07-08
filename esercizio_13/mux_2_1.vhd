library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2_1 is
    Port ( a : in  STD_LOGIC_VECTOR(1 downto 0);
				b : in STD_LOGIC_VECTOR(1 downto 0);
           s : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR(1 downto 0));
end mux_2_1;

architecture dataflow of mux_2_1 is

begin

y 	<= 	a when s='0' else	
			b when s='1'  else
			
				"--";
end dataflow;

