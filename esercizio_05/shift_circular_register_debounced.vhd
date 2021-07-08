library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_circular_register_debounced is
    Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           init : in  STD_LOGIC_VECTOR (0 to 7);
           y : out  STD_LOGIC_VECTOR (0 to 7));
end shift_circular_register_debounced;

architecture structural of shift_circular_register_debounced is

signal a : std_logic;

signal a2 : std_logic;
component shift_circular_register
Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           init : in  STD_LOGIC_VECTOR (0 to 7);
           y : out  STD_LOGIC_VECTOR (0 to 7));
end component;


component debounce is
GENERIC(
    counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
 -- reset_n : IN  STD_LOGIC;  --asynchronous active low reset
    button  : IN  STD_LOGIC;  --input signal to be debounced
    result  : OUT STD_LOGIC); --debounced signal
 end component;

begin

deb : debounce
	Port map (
		button => button,
		clk => clk,
		result => a
		--reset_n => rst
		);
		
--deb2: debounce
--Port map (
--		button => rst,
	--	clk => clk,
		--result => a2,
		--reset_n => rst
		--);

reg : shift_circular_register
	Port map (
	clk => clk,
           button => a,
			  rst => rst,
           init => init,
           y => y
);

end structural;

