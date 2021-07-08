LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY rca_8_tb IS
END rca_8_tb;
 
ARCHITECTURE behavior OF rca_8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rca_8
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         y : IN  std_logic_vector(7 downto 0);
         s : OUT  std_logic_vector(7 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal y : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(7 downto 0);
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rca_8 PORT MAP (
          x => x,
          y => y,
          s => s,
          c_out => c_out
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		
		x <= "00001111";
		y <= "10011000";
		
		wait for 10 ns;
		
      x <= "10001111";
		y <= "10011000";
      wait;
   end process;

END;
