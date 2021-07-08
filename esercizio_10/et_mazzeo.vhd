library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity et_mazzeo is
    Port ( clk : in  STD_LOGIC;
           d : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           q : out  STD_LOGIC;
			  not_q : out STD_LOGIC);
end et_mazzeo;

architecture Behavioral of et_mazzeo is

begin

	ff: process( CLK, RST )
	begin
		if (RST = '0') then
		if( CLK'event and CLK = '0' ) then
		Q <= D;
		not_q <= not(D);
		end if;
		else Q <= '0';
		not_q <= '1';
		end if;
	end process;

end Behavioral;

