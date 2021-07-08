--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:19:47 11/28/2019
-- Design Name:   
-- Module Name:   C:/Users/Windows/Desktop/Progetto/esercizio_06/cont_mod_2_2_tb.vhd
-- Project Name:  esercizio_06
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cont_mod_2_2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cont_mod_2_2_tb IS
END cont_mod_2_2_tb;
 
ARCHITECTURE behavior OF cont_mod_2_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont_mod_2_2
    PORT(
         rst : IN  std_logic;
         t : IN  std_logic;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal t : std_logic := '0';

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant t_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont_mod_2_2 PORT MAP (
          rst => rst,
          t => t,
          y => y
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

    

      -- insert stimulus here 
		
		rst <= '1';
		t <= '1';
		
		wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';
		
		wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';wait for 5 ns;
		
		t <= '0';
		
		wait for 5 ns;
		
		t <= '1';

      wait;
   end process;

END;
