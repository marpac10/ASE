library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity logic_arbiter is
    Port ( enable : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (1 downto 0));
end logic_arbiter;

architecture Behavioral of logic_arbiter is

begin

process (enable)
begin
if enable(0) = '1' then y <= "00";
elsif enable(1) = '1' then y <= "01";
elsif enable(2) = '1' then y <= "10";
elsif enable(3) = '1' then y <= "11";
else y <= "UU";
end if;
end process;


end Behavioral;

