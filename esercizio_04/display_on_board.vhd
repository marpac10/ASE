library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_on_board is
	Port(
		  clock : in  STD_LOGIC;
		  reset : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
		  anodes : out  STD_LOGIC_VECTOR (7 downto 0);
		  cathodes : out  STD_LOGIC_VECTOR (7 downto 0);
		  c_out : out STD_LOGIC
			  );
			  
end display_on_board;

architecture Structural of display_on_board is

--signal clock_fx : std_logic := '0';

COMPONENT display_seven_segments
GENERIC(
				clock_frequency_in : integer := 100000000;
				clock_frequency_out : integer := 50000
				);
	PORT(
		clock : IN std_logic;
		reset_n : IN std_logic;
		value : IN std_logic_vector(7 downto 0);--4 nibble da mostrare   
		anodes : OUT std_logic_vector(7 downto 0);
		cathodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT rca_8_sintesi
	 Port (  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           c_out : out  STD_LOGIC);
end component;



signal reset_n : std_logic;
signal cu_value : std_logic_vector(7 downto 0);

begin

reset_n <= not reset;

seven_segment_array: display_seven_segments 
GENERIC MAP(
	clock_frequency_in => 100000000,
	clock_frequency_out => 50000
	)
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
	
rca: rca_8_sintesi PORT MAP(
		clock => clock,
		reset_n => reset_n,
		load_first => load_first,
		load_second => load_second,
		in_byte => in_byte,
		s => cu_value,
		c_out => c_out
		
	);
	
	

			  
	

end Structural;