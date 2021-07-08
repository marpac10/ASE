library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;

entity cont_mod_16_parallelo is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           button : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end cont_mod_16_parallelo;

architecture Structural of cont_mod_16_parallelo is

signal u : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
signal a : std_logic;
signal b : std_logic;

component cont_mod_2
	  Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  button : in STD_LOGIC;
           y : out  STD_LOGIC);
end component;

component cont_mod_2_parallelo
   Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  button : in STD_LOGIC;
			  x : in STD_LOGIC;
           y : out  STD_LOGIC);
end component;


begin

a <= u(0) and u(1);
b <= a and u(2);


mod_0: cont_mod_2
	Port map (
		clk => clk,
		rst => rst,
		button => button,
		y => u(0)
		);
		
mod_1: cont_mod_2_parallelo
	Port map (
	clk => clk,
	rst => rst,
	button => button,
	x => u(0),
	y => u(1)
	);
	
	mod_2: cont_mod_2_parallelo
	Port map (
	clk => clk,
	rst => rst,
	button => button,
	x => a,
	y => u(2)
	);
	
	mod_3: cont_mod_2_parallelo
	Port map (
	clk => clk,
	rst => rst,
	button => button,
	x => b,
	y => u(3)
	);

y <= u;
end Structural;

