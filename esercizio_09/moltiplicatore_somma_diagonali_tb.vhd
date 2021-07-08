LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY moltiplicatore_somma_diagonali_tb IS
END moltiplicatore_somma_diagonali_tb;
 
ARCHITECTURE behavior OF moltiplicatore_somma_diagonali_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT moltiplicatore_somma_diagonali
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: moltiplicatore_somma_diagonali PORT MAP (
          a => a,
          b => b,
          y => y
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		a <= "11100110";
		b <= "10101011";
		

      wait;
   end process;

END;
