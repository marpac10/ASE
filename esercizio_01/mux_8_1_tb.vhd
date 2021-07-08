LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY mux_8_1_tb IS
END mux_8_1_tb;
 
ARCHITECTURE behavior OF mux_8_1_tb IS 
 
   
 
    COMPONENT mux_8_1
    PORT(
         x : IN  std_logic_vector(0 to 7);
         s : IN  std_logic_vector(2 downto 0);
         y : OUT  std_logic
        );
    END COMPONENT;


   signal input : std_logic_vector(0 to 7) := (others => '0');
   signal control : std_logic_vector(2 downto 0) := (others => '0');


   signal output : std_logic;
  
 
   
 
BEGIN
 

   uut: mux_8_1 PORT MAP (
          x => input,
          s => control,
          y => output
        );
 
  
   stim_proc: process
   begin		
     
      wait for 8 ns;	
     
	  input <= "10000000";
	  control <= "001" ;
	  
	  wait for 6 ns;
	
	assert output = '0' 
		report "errore1"
		severity failure;
		
		 input <= "11110000";
	  control <= "010" ;
	  
	  wait for 6 ns;
	
	assert output = '1' 
		report "errore2"
		severity failure;

		input <= "10101010";
	  control <= "111" ;
	  
	  wait for 6 ns;
	
	assert output = '0' 
		report "errore3"
		severity failure;
		
      wait;
   end process;

END;
