library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity uart_tappo is
    Port ( 
	 clk : in STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (7 downto 0);
           load : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC
			  --TBE : out STD_LOGIC;
			  --PE		: out 	std_logic;									
			  --FE		: out 	std_logic;							
			  --OE		: out 	std_logic;
			 -- RDA : inout std_logic
			  );
end uart_tappo;

architecture structural of uart_tappo is


component control_unit 
Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           data : out  STD_LOGIC_VECTOR(7 downto 0)
           
			  );
end component;
 
component UARTcomponent is
	Generic (
		--@48MHz
--		BAUD_DIVIDE_G : integer := 26; 	--115200 baud
--		BAUD_RATE_G   : integer := 417

		--@26.6MHz
		BAUD_DIVIDE_G : integer := 14; 	--115200 baud
		BAUD_RATE_G   : integer := 231
	);
	Port (	
		TXD 	: out 	std_logic  	:= '1';					-- Transmitted serial data output
		RXD 	: in  	std_logic;							-- Received serial data input
		CLK 	: in  	std_logic;							-- Clock signal
		DBIN 	: in  	std_logic_vector (7 downto 0);		-- Input parallel data to be transmitted
		DBOUT 	: out 	std_logic_vector (7 downto 0);		-- Recevived parallel data output
		RDA		: inout  std_logic;							-- Read Data Available, dato disponibile in lettura
		TBE		: out 	std_logic 	:= '1';					-- Transfer Buffer Empty
		RD		: in  	std_logic;							-- Read Strobe, abilito la lettura
		WR		: in  	std_logic;							-- Write Strobe, abilito la scrittura
		PE		: out 	std_logic;							-- Parity error		
		FE		: out 	std_logic;							-- Frame error
		OE		: out 	std_logic;							-- Overwrite error
		RST		: in  	std_logic	:= '0');				-- Reset signal
						
end component;

signal dato : std_logic;
signal reset_n : std_logic;
signal reg_value : std_logic_vector (7 downto 0);
begin

reset_n <= not reset;

u : UARTcomponent 
generic map (
BAUD_DIVIDE_G => 14,
BAUD_RATE_G => 231
) 
port map (
txd => dato,
rxd => dato,
clk => clk,
dbin => reg_value,
dbout => output,
rd => '0',
wr => load,
rst => reset
);

cu: control_unit 
port map (
clock => clk,
reset_n => reset_n,
load => load,
in_byte => in_byte,
data => reg_value
);


end structural;

