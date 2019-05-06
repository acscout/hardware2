----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/09/2019 01:14:50 PM
-- Design Name: 
-- Module Name: One_bit_Adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- PErform one bit addition
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

entity One_bit_Adder is
  Port (
  x,y,cin  : in std_logic;
  sum,cout : out std_logic 
);
end One_bit_Adder;

architecture MY_DATAFLOW of One_bit_Adder is

begin
    sum <= (x XOR y) XOR cin;
    cout<= (x AND y) OR (x AND cin) OR (y AND cin);
end;

