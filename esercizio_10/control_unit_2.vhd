library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_unit_2 is
Port ( clk : in STD_LOGIC;
			d : in STD_LOGIC;
				start : in STD_LOGIC;
			 enable : out STD_LOGIC;
			 init : out STD_LOGIC;
			 s : out STD_LOGIC
		--	 q : out STD_LOGIC
			 );
			 

end control_unit_2;

architecture Behavioral of control_unit_2 is


BEGIN


variable counter : integer range 0 to 4 := 0;

control : PROCESS(clk)



BEGIN
enable <= '0';
init <= '0';
s <= '1';

if (clk'event and clk = '0') then

--if (counter = 0) then
--if start = '1' then
--init <= '1';
--counter := 1;
--end if;
--end if;
--if (counter = 1) then
--if d = '1' then
--s <= '0';
--else s <= '1';
--end if;
--enable <= '1';
--counter := 2;
--end if;
--if counter = 2 then
--if d = '1' then
--s <= '0';
--else s <= '1';
--end if;
--enable <= '1';
--counter := 3;
--end if;
--if counter = 3 then
--if d = '1' then
--s <= '0';
--else s <= '1';
--end if;
--enable <= '1';
--counter := 4;
--end if;
--if counter = 4 then
--if d = '1' then
--s <= '0';
--else s <= '1';
--counter :=0;
--end if;
--end if;
--end if;
--END PROCESS;



CASE counter IS
WHEN 0 =>
if start = '1' then
init <= '1';
counter := 1;
--else next_state <= current_state;
end if;
WHEN 1 =>
if d = '1' then
s <= '0';
else s <= '1';
end if;
enable <= '1';
counter := 2;
WHEN 2 =>
if d = '1' then
s <= '0';
else s <= '1';
end if;
enable <= '1';
counter := 3;
WHEN 3 =>
if d = '1' then
s <= '0';
else s <= '1';
end if;
enable <= '1';
counter := 4;
WHEN 4 =>
if d = '1' then
s <= '0';
else s <= '1';
counter :=0;
end if;
END CASE;
end if;
END PROCESS;


end Behavioral;

