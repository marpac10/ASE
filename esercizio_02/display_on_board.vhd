library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_on_board is
	Port(
		  clock : in  STD_LOGIC;
		  reset : in  STD_LOGIC;
		  in_byte : in STD_LOGIC_VECTOR(3 downto 0); 
		  anodes : out  STD_LOGIC_VECTOR (7 downto 0);
		  cathodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
			  
end display_on_board;

architecture Structural of display_on_board is

COMPONENT display_seven_segments
	PORT(
		clock : IN std_logic;
		value : IN std_logic_vector(3 downto 0);--4 nibble da mostrare   
		anodes : OUT std_logic_vector(7 downto 0);
		cathodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT control_unit
	PORT(
		clock : IN std_logic;
		reset_n : IN std_logic;
		in_byte : IN std_logic_vector(3 downto 0);          
		value : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

signal reset_n : std_logic;
signal cu_value : std_logic_vector(3 downto 0);

begin

reset_n <= not reset;

seven_segment_array: display_seven_segments 
	PORT MAP(
		clock => clock,
		value => cu_value,		
		anodes => anodes,
		cathodes => cathodes
);

cu: control_unit PORT MAP(
		clock => clock,
		reset_n => reset_n,
		in_byte => in_byte,
		value => cu_value
		
	);

end Structural;