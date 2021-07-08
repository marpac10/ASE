library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity mux_8_1 is
    Port ( x : in  STD_LOGIC_VECTOR (0 to 7);
           s : in  STD_LOGIC_VECTOR (2 downto 0);
           y : out  STD_LOGIC);
end mux_8_1;

architecture Structural of mux_8_1 is

signal u : STD_LOGIC_VECTOR (0 to 1) := (others => '0');

component mux_2_1
		Port(
			a2 	: in STD_LOGIC_VECTOR (0 to 1);
			s2 	: in STD_LOGIC;
			y2 	: out STD_LOGIC
		);
	end component;

component mux_4_1
		Port(
			a4 	: in STD_LOGIC_VECTOR (0 to 3);
			s4 	: in STD_LOGIC_VECTOR (1 downto 0);
			y4 	: out STD_LOGIC
		);
	end component;


begin

mux0: mux_4_1
		Port map(
					a4 => x(0 to 3),
					s4=> s(1 downto 0),
					y4 => u(0)
		);
		
	mux1: mux_4_1
		Port map(
					a4 => x(4 to 7),
					s4 => s(1 downto 0),
					y4 => u(1)
		);
		
	mux2: mux_2_1
		Port map(
					a2 => u(0 to 1),
					s2 => s(2),
					y2 => y
		);


end Structural;

