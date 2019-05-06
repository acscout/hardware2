----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2019 06:14:57 PM
-- Design Name: 
-- Module Name: MUX5_bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
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

entity MUX5_bit is
Port ( 
x,y : in std_logic_vector(4 downto 0);
control : in std_logic;
z : out std_logic_vector(4 downto 0)
);
end MUX5_bit;

architecture Behavioral of MUX5_bit is

begin
z <= x when(control = '0') else
     y;

end Behavioral;
