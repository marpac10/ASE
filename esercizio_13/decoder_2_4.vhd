library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder_2_4 is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder_2_4;

architecture Behavioral of decoder_2_4 is

begin

process (x) 
begin

if x = "00" then y <= "0001";
elsif x = "01" then y <= "0010";
elsif x = "10" then y <= "0100";
else y <= "1000";
end if;
end process;

end Behavioral;

