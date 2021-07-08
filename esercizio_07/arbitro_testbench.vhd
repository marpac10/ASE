library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity arbitro_testbench is
end arbitro_testbench;

architecture behavioral of arbitro_testbench is

	component arbitro is
	Port( A1 : in STD_LOGIC;
	      A2 : in STD_LOGIC;
	      A3 : in STD_LOGIC;
	      U : out STD_LOGIC
	     );
    end component;

signal a1 : STD_LOGIC:='0';
signal a2 :  STD_LOGIC:='0';
signal a3 :  STD_LOGIC:='0';
signal u:  STD_LOGIC:='0';

begin

	uut: arbitro Port map(a1,a2,a3,u);

	stim_proc: process
	begin
	
	wait for 10 ns;
	a1 <= '1';
    a2 <= '1';
    a3 <='0';
	wait for 20 ns;
    
    assert u='1'
    report "errore"
    severity failure;
    
    a1 <= '0';
    a2 <= '1';
    a3 <='0';
	wait for 20 ns;
    
    assert u='0'
    report "errore"
    severity failure;

    a1 <= '1';
    a2 <= '0';
    a3 <='0';
	wait for 20 ns;
    
    assert u='0'
    report "errore"
    severity failure;
	wait;
	end process;
end; 
