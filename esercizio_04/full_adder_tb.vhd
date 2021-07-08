--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:14:01 11/26/2019
-- Design Name:   
-- Module Name:   C:/Users/Windows/Desktop/Progetto/esercizio_04/full_adder_tb.vhd
-- Project Name:  esercizio_04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         x : IN  std_logic;
         y : IN  std_logic;
         c_in : IN  std_logic;
         s : OUT  std_logic;
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal c_in : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          x => x,
          y => y,
          c_in => c_in,
          s => s,
          c_out => c_out
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     

      -- insert stimulus here 
		
		x <= '0';
		y <= '1';
		c_in <= '0';
		
		wait for 5 ns;
		
		x <= '1';
		y <= '1';
		c_in <= '0';
		
		wait for 5 ns;
		
		x <= '0';
		y <= '0';
		c_in <= '1';
		
		wait for 5 ns;
		
		x <= '1';
		y <= '0';
		c_in <= '1';
		
		wait for 5 ns;
		
		

      wait;
   end process;

END;
