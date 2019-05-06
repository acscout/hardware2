----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/12/2019 03:05:32 PM
-- Design Name: 
-- Module Name: One_bit_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Perform one bit addition
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

entity One_bit_adder is 
Port (
    x,y,cin:  in std_logic; --input bits and carry
    sum,cout: out std_logic  --sum and carry output bits
);
end One_bit_adder;

architecture Behavioral of One_bit_adder is

begin
    sum  <= (x XOR y) XOR cin;
    cout <= (x AND y) OR (x AND cin) OR (y AND cin);
end Behavioral;
