----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/09/2019 01:00:22 PM
-- Design Name: 
-- Module Name: Overflow_unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  Check if the carry out from the ALU is in overflow
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Overflow_unit is
Port ( 
overflowTemp : in std_logic;
func : in std_logic_vector(5 downto 0);
overflow : out std_logic
);
end Overflow_unit;

architecture Behavioral of Overflow_unit is

begin

overflow <= NOT overflowTemp when (func(3) = '1') else
            overflowTemp when (func(1 downto 0) = "10") else
            overflowTemp when (func(1 downto 0) = "11") else
            '0';

end Behavioral;
