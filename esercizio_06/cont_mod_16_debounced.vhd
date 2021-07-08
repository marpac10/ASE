library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity cont_mod_16_debounced is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           button : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end cont_mod_16_debounced;

architecture Structural of cont_mod_16_debounced is

signal u : std_logic;
signal u2 : std_logic;


component cont_mod_16_serie
	Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
			button : in STD_LOGIC;
         y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component debounce is
GENERIC(
    counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC); --debounced signal
 end component;

begin

deb : debounce
	Port map (
		button => button,
		clk => clk,
		result => u
		
		);
		
deb2 : debounce
	Port map (
		button => rst,
		clk => clk,
		result => u2
		
		);

mod_0 : cont_mod_16_serie
	Port map (
		clk => clk,
		rst => u2,
		button => u,
		y => y
		);





end Structural;
