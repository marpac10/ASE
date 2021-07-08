library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca_8_sintesi is
    Port (  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           c_out : out  STD_LOGIC);
end rca_8_sintesi;

architecture structural of rca_8_sintesi is


COMPONENT control_unit 
Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           first : out  STD_LOGIC_VECTOR(7 downto 0);
           second : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end component;


COMPONENT rca_8 
Port ( x : in  STD_LOGIC_VECTOR (7 downto 0);
           y : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0);
           c_out : out  STD_LOGIC);
end component;

signal cu_first : std_logic_vector(7 downto 0);
signal cu_second : std_logic_vector(7 downto 0);

begin

rca: rca_8 
PORT MAP (
	x => cu_first,
	y => cu_second,
	s => s,
	c_out => c_out

);

cu: control_unit PORT MAP ( 
			  clock => clock,
           reset_n => reset_n,
			  load_first => load_first,
           load_second => load_second,
			  in_byte => in_byte,
           first => cu_first,
           second => cu_second
);

end structural;

