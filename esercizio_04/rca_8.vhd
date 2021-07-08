library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_8 is
    Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           c_out : out  STD_LOGIC);
end rca_8;

architecture structural of rca_8 is

signal u : std_logic;

component rca_4 
	Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
			  c_in : in STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c_out : out  STD_LOGIC);
end component;



begin

rca_0 : rca_4
	port map (
	x => x(3 downto 0),
	y => y(3 downto 0),
	c_in => '0',
	s => s(3 downto 0),
	c_out => u
);

rca_1 : rca_4
	port map (
	x => x(7 downto 4),
	y => y(7 downto 4),
	c_in => u,
	s => s(7 downto 4),
	c_out => c_out
);


end structural;

