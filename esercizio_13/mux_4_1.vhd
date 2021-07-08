library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_4_1 is
    Port (  a : in  STD_LOGIC_VECTOR(1 downto 0);
				b : in  STD_LOGIC_VECTOR(1 downto 0);
				c : in  STD_LOGIC_VECTOR(1 downto 0);
				d : in  STD_LOGIC_VECTOR(1 downto 0);
           s : in  STD_LOGIC_VECTOR(1 downto 0);
           y : out  STD_LOGIC_VECTOR(1 downto 0));
end mux_4_1;

architecture dataflow of mux_4_1 is

begin

y 	<= 	a when s="00" else	
			b when s="01" else
			c when s="10" else
			d when s="11" else
				"--";

end dataflow;

