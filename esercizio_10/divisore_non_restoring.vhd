library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity divisore_restoring is
    Port (-- dividendo : in  STD_LOGIC_VECTOR (6 downto 0);
           --divisore : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
           in_byte : in  STD_LOGIC_VECTOR (3 downto 0);
           reg : out STD_LOGIC_VECTOR (7 downto 0));
end divisore_restoring;

architecture structural of divisore_restoring is

--signal registro : std_logic_vector (4 downto 0);
--signal u_shift : std_logic_vector (7 downto 0);
--signal selezione : std_logic;
signal clk_fx : std_logic;
--signal dato : std_logic;
--signal random : std_logic;
--signal ab : std_logic;
--signal inizio : std_logic;
signal reg_dividendo : std_logic_vector (3 downto 0);
signal reg_divisore : std_logic_vector (3 downto 0);
signal reset : std_logic;


--component adder_subtracter
--Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
--           b : in  STD_LOGIC_VECTOR (4 downto 0);
--           s : in  STD_LOGIC;
--           y : out  STD_LOGIC_VECTOR (4 downto 0));
--           --segno : out  STD_LOGIC);
--end component;
--
component clock_filter
generic(
				clock_frequency_in : integer := 100000000;
				clock_frequency_out : integer := 50000
				);
    Port ( clock_in : in  STD_LOGIC;
				reset_n : in STD_LOGIC;
           clock_out : out  STD_LOGIC);
end component;
--
--component et_mazzeo
--Port ( clk : in  STD_LOGIC;
--           d : in  STD_LOGIC;
--			  rst : in STD_LOGIC;
--           q : out  STD_LOGIC;
--			  not_q : out STD_LOGIC);
--end component;
--
--component shift_register
--port (
--		clk : in STD_LOGIC;
--		enable : in STD_LOGIC;
--		init : in STD_LOGIC;
--		d : in STD_LOGIC;
--		reg : in STD_LOGIC_VECTOR (3 downto 0);
--		x : in STD_LOGIC_VECTOR (7 downto 0);
--		y : buffer STD_LOGIC_VECTOR (7 downto 0)
--		);
--		
--end component;

component control_unit
 Port ( clk : in STD_LOGIC;
			reset_n : in STD_LOGIC;
           a : out STD_LOGIC_VECTOR (3 downto 0); --dividendo
           b : out  STD_LOGIC_VECTOR (3 downto 0); --divisore
			  in_byte : in STD_LOGIC_VECTOR (3 downto 0);
			  load_first : in STD_LOGIC;
			  load_second : in STD_LOGIC
--			  d : in STD_LOGIC;
--			  enable : out STD_LOGIC;
--			  init : out STD_LOGIC;
--			  s : out STD_LOGIC
			  );
end component;

component divisore
port(clk,reset:in std_logic;
start:in std_logic;
dvsr,dvnd:in std_logic_vector(3 downto 0);
ready,done_tick:out std_logic;
quo,rmd:out std_logic_vector(3 downto 0)
);
end component;

--signal start : std_logic;

begin

reset <= not rst_n;


div : divisore port map (
clk => clk,
reset => reset,
start => load_second,
dvsr => reg_divisore,
dvnd => reg_dividendo,
quo => reg (7 downto 4),
rmd => reg (3 downto 0)
);




--as : adder_subtracter
--port map (
--a => dato & reg(7 downto 4),
--b => '0' & reg_divisore,
--s => selezione,
--y => registro
--
--);
--
cf : clock_filter
generic map(
				clock_frequency_in => 100000000,
				clock_frequency_out => 50000
				)
port map (
clock_in => clk,
reset_n => rst_n,
clock_out => clk_fx
);
--
--ff: et_mazzeo
--port map(
--clk => clk,
--d => registro(4),
--rst => '0',
--q => dato,
--not_q => random
--);
--
--sr : shift_register
--port map (
--clk => clk_fx,
--enable => ab,
--init => inizio,
--d => selezione,
--reg => registro(3 downto 0),
--x => reg_dividendo & '0',
--y => reg
--);

cu: control_unit
port map(
clk => clk_fx,
reset_n => rst_n,
a => reg_dividendo,
b => reg_divisore,
in_byte => in_byte,
load_first => load_first,
load_second => load_second
--d => dato,
--enable => ab,
--init => inizio,
--s => selezione
);



end structural;

