LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY omega_network_tb IS
END omega_network_tb;
 
ARCHITECTURE behavior OF omega_network_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT omega_network
    PORT(
         src : IN  std_logic_vector(1 downto 0);
         dst : IN  std_logic_vector(1 downto 0);
         dati : IN  std_logic_vector(7 downto 0);
         reg_destination : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal src : std_logic_vector(1 downto 0) := (others => '0');
   signal dst : std_logic_vector(1 downto 0) := (others => '0');
   signal dati : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal reg_destination : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: omega_network PORT MAP (
          src => src,
          dst => dst,
          dati => dati,
          reg_destination => reg_destination
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		
		dati <= "00100000";
		
		src <= "10";
		dst <= "00";
		
		wait for 10 ns;
		
		dati <= "UUUUUUUU";
		
		wait for 5 ns;
		dati <= "01000000";
		src <= "11";
		dst <= "10";
		
		wait for 10 ns;
		
		dati <= "UUUUUUUU";
		
		wait for 5 ns;
		dati <= "00000011";
		src <= "00";
		dst <= "11";
		
		wait for 5 ns;
		
		dati <= "UUUUUUUU";
	
 wait for 10 ns;
dati <= "00110000"; 
	src <= "10";
		dst <= "00";
		
		wait for 10 ns;
		
		dati <= "UUUUUUUU";
		
		wait for 5 ns;
		dati <= "01000000";
		src <= "11";
		dst <= "10";

      wait;
   end process;

END;
