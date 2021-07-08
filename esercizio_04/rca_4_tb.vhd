--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:10:37 11/26/2019
-- Design Name:   
-- Module Name:   C:/Users/Windows/Desktop/Progetto/esercizio_04/rca_4_tb.vhd
-- Project Name:  esercizio_04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rca_4
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
 
ENTITY rca_4_tb IS
END rca_4_tb;
 
ARCHITECTURE behavior OF rca_4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rca_4
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         c_in : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rca_4 PORT MAP (
          x => x,
          y => y,
          c_in => c_in,
          s => s,
          c_out => c_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     

      -- insert stimulus here 
		
		
		x <= "0110";
		y <= "1000";
		c_in <= '0';
		
		wait for 10 ns;
		
		x <= "1110";
		y <= "1000";
		c_in <= '1';
		

      wait;
   end process;

END;
