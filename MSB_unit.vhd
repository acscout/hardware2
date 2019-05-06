----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/09/2019 12:55:48 PM
-- Design Name: 
-- Module Name: MSB_unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  Sort the input signals into the control signals used by the other ALU files
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

entity MSB_unit is
Port ( 
func : in std_logic_vector(5 downto 0);
ALUop : in std_logic_vector(1 downto 0);
bin,opShift : out std_logic;
opALU : out std_logic_vector(1 downto 0);
outputControl : out std_logic_vector(1 downto 0)
);
end MSB_unit;

architecture Behavioral of MSB_unit is

begin

outputControl <= ALUop;
opALU <= func(1 downto 0);
opShift <= func(2);
bin <= '1' when (func = "000010") else
        func(3);



end Behavioral;
