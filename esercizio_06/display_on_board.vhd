library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_on_board is
--GENERIC(
	--			clock_frequency_in : integer := 100000000;
		--		clock_frequency_out : integer := 50000
			--	);
	Port(
		  clock : in  STD_LOGIC;
		  reset : in  STD_LOGIC;
		  button : in STD_LOGIC; 
		  anodes : out  STD_LOGIC_VECTOR (7 downto 0);
		  cathodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
			  
end display_on_board;

architecture Structural of display_on_board is

--signal clock_fx : std_logic := '0';

COMPONENT display_seven_segments
--GENERIC(
	--			clock_frequency_in : integer := 100000000;
		--		clock_frequency_out : integer := 50000
			--	);
	PORT(
		clock : IN std_logic;
		reset_n : IN std_logic;
		value : IN std_logic_vector(3 downto 0);--4 nibble da mostrare   
		anodes : OUT std_logic_vector(7 downto 0);
		cathodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT cont_mod_16_debounced
	Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           button : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

--COMPONENT clock_filter
	--GENERIC(
		--		clock_frequency_in : integer := 100000000;
				--clock_frequency_out : integer := 50000
			--	);
	--PORT(
		--clock_in : IN std_logic; 
      --reset_n : in  STD_LOGIC;		
		--clock_out : OUT std_logic
		--);
--END COMPONENT;

signal reset_n : std_logic;
signal cu_value : std_logic_vector(3 downto 0);

begin

reset_n <= not reset;

seven_segment_array: display_seven_segments 
--GENERIC MAP(
	--clock_frequency_in => 100000000,
	--clock_frequency_out => 50000
	--)
	PORT MAP(
		clock => clock,
		reset_n => reset_n,
		value => cu_value,		
		anodes => anodes,
		cathodes => cathodes
);


--clk_filter: clock_filter GENERIC MAP(
	--clock_frequency_in => clock_frequency_in,
	--clock_frequency_out => clock_frequency_out
	--)
	--PORT MAP(
		--clock_in => clock,
		--reset_n => reset_n,
		--clock_out => clock_fx
	--);
	
cu: cont_mod_16_debounced PORT MAP(
		clk => clock,
		rst => reset_n,
		button => button,
		y => cu_value
		
	);

end Structural;