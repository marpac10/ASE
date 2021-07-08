library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_4_1 is
    Port ( a4 : in  STD_LOGIC_VECTOR(0 to 3);
           s4 : in  STD_LOGIC_VECTOR(1 downto 0);
           y4 : out  STD_LOGIC);
end mux_4_1;

architecture dataflow of mux_4_1 is

begin

y4 	<= 	a4(0) when s4="00" else	
			a4(1) when s4="01" else
			a4(2) when s4="10" else
			a4(3) when s4="11" else
				'-';

end dataflow;

