library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_4 is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
			  c_in : in STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC);
end rca_4;

architecture structural of rca_4 is



component full_adder
Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end component;
	
	
signal c1,c2,c3 : std_logic;
begin

adder_0 : full_adder 
	port map (
	x => x(0),
	y => y(0),
	c_in => c_in,
	s => s(0),
	c_out => c1
);

adder_1 : full_adder 
	port map (
	x => x(1),
	y => y(1),
	c_in => c1,
	s => s(1),
	c_out => c2
);

adder_2 : full_adder 
	port map (
	x => x(2),
	y => y(2),
	c_in => c2,
	s => s(2),
	c_out => c3
);

adder_3 : full_adder 
	port map (
	x => x(3),
	y => y(3),
	c_in => c3,
	s => s(3),
	c_out => c_out
);


end structural;

