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



component cont_mod_16_serie
	Port ( clk : in  STD_LOGIC;
         rst : in  STD_LOGIC;
			button : in STD_LOGIC;
         y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component debounce is
GENERIC(
    clk_freq    : INTEGER := 100_000_000;  --system clock frequency in Hz
    stable_time : INTEGER := 1);         --time button must remain stable in ms
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    reset_n : IN  STD_LOGIC;  --asynchronous active low reset
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC); --debounced signal
 end component;

begin

deb : debounce
	Port map (
		button => button,
		clk => clk,
		result => u,
		reset_n => rst
		);

mod_0 : cont_mod_16_serie
	Port map (
		clk => clk,
		rst => rst,
		button => u,
		y => y
		);





end Structural;

