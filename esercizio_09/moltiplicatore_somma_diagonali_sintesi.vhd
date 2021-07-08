library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moltiplicatore_somma_diagonali_sintesi is
    Port (  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end moltiplicatore_somma_diagonali_sintesi;

architecture structural of moltiplicatore_somma_diagonali_sintesi is


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


COMPONENT moltiplicatore_somma_diagonali
Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

signal cu_first : std_logic_vector(7 downto 0);
signal cu_second : std_logic_vector(7 downto 0);

begin

msd: moltiplicatore_somma_diagonali
PORT MAP (
	a => cu_first,
	b => cu_second,
	y => y
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

