----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2019 12:59:47 PM
-- Design Name: 
-- Module Name: Shifting_entity - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shifting_entity is
Port ( 
a : in std_logic_vector (31 downto 0);
dir : in std_logic;
z : out std_logic_vector (31 downto 0)
);
end Shifting_entity;

architecture Behavioral of Shifting_entity is
signal leftTemp, rightTemp : std_logic_vector(31 downto 0);

begin

--process
--begin
--leftTemp(0) <= '0';
--for i in 0 to 30 loop
--    leftTemp((i+1)) <= a(i);
--    wait for 1 ns;
--end loop;
--for k in 0 to 30 loop
--    rightTemp(k) <= a(k+1);
--    wait for 1 ns;
--end loop;
--rightTemp(31) <= '0';
--end process;

leftTemp(0) <= '0';
leftTemp(1) <= a(0);
leftTemp(2) <= a(1);
leftTemp(3) <= a(2);
leftTemp(4) <= a(3);
leftTemp(5) <= a(4);
leftTemp(6) <= a(5);
leftTemp(7) <= a(6);
leftTemp(8) <= a(7);
leftTemp(9) <= a(8);
leftTemp(10) <= a(9);
leftTemp(11) <= a(10);
leftTemp(12) <= a(11);
leftTemp(13) <= a(12);
leftTemp(14) <= a(13);
leftTemp(15) <= a(14);
leftTemp(16) <= a(15);
leftTemp(17) <= a(16);
leftTemp(18) <= a(17);
leftTemp(19) <= a(18);
leftTemp(20) <= a(19);
leftTemp(21) <= a(20);
leftTemp(22) <= a(21);
leftTemp(23) <= a(22);
leftTemp(24) <= a(23);
leftTemp(25) <= a(24);
leftTemp(26) <= a(25);
leftTemp(27) <= a(26);
leftTemp(28) <= a(27);
leftTemp(29) <= a(28);
leftTemp(30) <= a(29);
leftTemp(31) <= a(30);


rightTemp(0) <= a(1);
rightTemp(1) <= a(2);
rightTemp(2) <= a(3);
rightTemp(3) <= a(4);
rightTemp(4) <= a(5);
rightTemp(5) <= a(6);
rightTemp(6) <= a(7);
rightTemp(7) <= a(8);
rightTemp(8) <= a(9);
rightTemp(9) <= a(10);
rightTemp(10) <= a(11);
rightTemp(11) <= a(12);
rightTemp(12) <= a(13);
rightTemp(13) <= a(14);
rightTemp(14) <= a(15);
rightTemp(15) <= a(16);
rightTemp(16) <= a(17);
rightTemp(17) <= a(18);
rightTemp(18) <= a(19);
rightTemp(19) <= a(20);
rightTemp(20) <= a(21);
rightTemp(21) <= a(22);
rightTemp(22) <= a(23);
rightTemp(23) <= a(24);
rightTemp(24) <= a(25);
rightTemp(25) <= a(26);
rightTemp(26) <= a(27);
rightTemp(27) <= a(28);
rightTemp(28) <= a(29);
rightTemp(29) <= a(30);
rightTemp(30) <= a(31);
rightTemp(31) <= '0';


z <= leftTemp when (dir = '0') else
     rightTemp;    
     
end Behavioral;
