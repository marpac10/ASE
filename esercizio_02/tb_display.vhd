LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_display IS
END tb_display;
 
ARCHITECTURE behavior OF tb_display IS 
 
    COMPONENT display_seven_segments
    PORT(
         clock : IN  std_logic;
         
         value : IN  std_logic_vector(3 downto 0);
         
         anodes : OUT  std_logic_vector(7 downto 0);
         cathodes : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
  
   signal value : std_logic_vector(3 downto 0) := (others => '0');
   

 	--Outputs
   signal anodes : std_logic_vector(7 downto 0);
   signal cathodes : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_seven_segments PORT MAP (
          clock => clock,
        
          value => value,
          
          anodes => anodes,
          cathodes => cathodes
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

		
		value <= "0100";
		
		wait for 10 ns;
		
		value <= "1000";
		
		wait for 10 ns;
		
		value <= "0001";
		
		wait for 10 ns;
		
		
		

      wait;
   end process;

END;
