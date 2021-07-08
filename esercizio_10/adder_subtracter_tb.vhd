LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY adder_subtracter_tb IS
END adder_subtracter_tb;
 
ARCHITECTURE behavior OF adder_subtracter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder_subtracter
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic;
         y : OUT  std_logic_vector(3 downto 0);
         segno : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal y : std_logic_vector(3 downto 0);
   signal segno : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder_subtracter PORT MAP (
          a => a,
          b => b,
          s => s,
          y => y,
          segno => segno
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here

		a <= "1010";
		b <= "0011";
		s <= '0';
		
		wait for 10 ns;
		
		a <= "1110";
		b <= "0011";
		s <= '0';
		
		wait for 10 ns;
		
		a <= "1011";
		b <= "0100";
		s <= '0';
		
		wait for 10 ns;
		
		a <= "0010";
		b <= "1011";
		s <= '1';
		
		wait for 10 ns;
		
		a <= "1011";
		b <= "1011";
		s <= '1';
		
		wait for 10 ns;
		
		a <= "1010";
		b <= "0011";
		s <= '1';
		
		wait for 10 ns;
			

      wait;
   end process;

END;
