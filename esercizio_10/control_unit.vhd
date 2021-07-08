library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( clk : in STD_LOGIC;
			reset_n : in STD_LOGIC;
           a : out STD_LOGIC_VECTOR (3 downto 0); --dividendo
           b : out  STD_LOGIC_VECTOR (3 downto 0); --divisore
			  in_byte : in STD_LOGIC_VECTOR (3 downto 0);
			  load_first : in STD_LOGIC;
			  load_second : in STD_LOGIC
			  --d : in STD_LOGIC;
			  --enable : out STD_LOGIC;
			  --init : out STD_LOGIC;
			  --s : out STD_LOGIC
           
           );
end control_unit;

architecture Behavioral of control_unit is

--TYPE state IS (
--idle,
--in1,
--op,
--result );
--SIGNAL current_state, next_state : state;



signal reg_first : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal reg_second : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
signal reset : std_logic;
--signal start : std_logic := '0' ;

begin


reset <= not reset_n;
a <= reg_first;
b <= reg_second;



main: process(clk, reset)
begin

	if reset = '1' then
		reg_first <= (others => '0');
		reg_second <= (others => '0');
	elsif clk'event and clk = '1' then
		if load_first = '1' then
			reg_first <= in_byte;
		elsif load_second = '1' then
			reg_second <= in_byte(3 downto 0);
			--start <= '1';
		end if;
		end if;
--		IF (clk'event and clk = '0') THEN
--IF (start = '1') THEN 
--current_state <= in1;
--start <= '0';
--ELSE current_state <= next_state;
--END IF;
--END IF;

end process;







--Comb: PROCESS (current_state, d) IS
--variable counter : integer range 0 to 3 := 0;
--BEGIN
--s <= '1'; enable <= '0'; -- valori asegnati per default
--init <= '0'; 
--counter := 0;
--next_state <= idle; 
--CASE current_state IS
--WHEN idle => next_state <= idle;
--WHEN in1 =>
--init <= '1';
--next_state <= op;
--WHEN op =>
--if d = '1' then
--s <= '0';
--else s <= '1';
--end if;
--enable <= '1';
--if (counter < 3) then
--next_state <= op;
--counter := counter + 1;
--else next_state <= result;
--end if;
--WHEN result => 
--if d = '1' then
--s <= '0';
--else s <= '1';
--counter := 0;
--next_state <= idle;
--END IF;
--END case;
--END PROCESS;

end Behavioral;