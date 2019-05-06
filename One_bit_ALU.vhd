----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/09/2019 01:15:15 PM
-- Design Name: 
-- Module Name: One_bit_ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Perform the one bit operations of ADD, AND, OR, and SUB
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

entity One_bit_ALU is
Port ( 
    a,b,cin : in std_logic;
    bin : in std_logic;
    op: in std_logic_vector(1 downto 0);
    result,cout   : out std_logic
);
end One_bit_ALU;

architecture Behavioral of One_bit_ALU is
signal tand,tor,tadd,btemp : std_logic;

component One_bit_Adder
        Port(
        x,y,cin : in std_logic;
        sum,cout : out std_logic
        );
end component;

begin
    btemp <= b when (bin = '0') else
             NOT b;
    tand <= a AND b;
    tor <= a OR b;
    FA: One_bit_Adder port map(x=>a,y=>btemp,cin=>cin,sum=>tadd,cout=>cout);
    result <= tand when (op = "00") else
              tor  when (op = "01") else
              tadd;           
    
end Behavioral;
