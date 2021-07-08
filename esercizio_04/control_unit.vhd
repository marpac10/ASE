----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:27 10/23/2012 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load_first : in  STD_LOGIC;
           load_second : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           first : out  STD_LOGIC_VECTOR(7 downto 0);
           second : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end control_unit;

architecture Behavioral of control_unit is

signal reg_first : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal reg_second : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal reset : std_logic;

begin

reset <= not reset_n;

first <= reg_first;
second <= reg_second;


main: process(clock, reset)
begin

	if reset = '1' then
		reg_first <= (others => '0');
		reg_second <= (others => '0');
	elsif clock'event and clock = '1' then
		if load_first = '1' then
			reg_first(7 downto 0) <= in_byte;
		elsif load_second = '1' then
			reg_second(7 downto 0) <= in_byte;
		end if;
	end if;

end process;


end Behavioral;


