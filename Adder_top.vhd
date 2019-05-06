----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/12/2019 03:05:03 PM
-- Design Name: 
-- Module Name: Adder_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Perform 32 bit addition by connecting 32 one-bit adder components
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

entity Adder_top is
Port ( 
a,b : in std_logic_vector(31 downto 0); --arguments
cin: in std_logic; --carry in
z: out std_logic_vector(31 downto 0); --32bit sum
cout: out std_logic --carry out
);
end Adder_top;

architecture Behavioral of Adder_top is
    signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31 : std_logic;
    component One_bit_adder --one bit adder component
        Port(
        x,y,cin : in std_logic;
        sum,cout : out std_logic
        );
    end component;
begin --32 1bit adders connected
    FA0 : One_bit_adder port map(x=>a(0),y=>b(0),cin=>cin,sum=>z(0),cout=>c1); 
    FA1 : One_bit_adder port map(x=>a(1),y=>b(1),cin=>c1,sum=>z(1),cout=>c2); 
    FA2 : One_bit_adder port map(x=>a(2),y=>b(2),cin=>c2,sum=>z(2),cout=>c3); 
    FA3 : One_bit_adder port map(x=>a(3),y=>b(3),cin=>c3,sum=>z(3),cout=>c4); 
    FA4 : One_bit_adder port map(x=>a(4),y=>b(4),cin=>c4,sum=>z(4),cout=>c5); 
    FA5 : One_bit_adder port map(x=>a(5),y=>b(5),cin=>c5,sum=>z(5),cout=>c6); 
    FA6 : One_bit_adder port map(x=>a(6),y=>b(6),cin=>c6,sum=>z(6),cout=>c7); 
    FA7 : One_bit_adder port map(x=>a(7),y=>b(7),cin=>c7,sum=>z(7),cout=>c8); 
    FA8 : One_bit_adder port map(x=>a(8),y=>b(8),cin=>c8,sum=>z(8),cout=>c9); 
    FA9 : One_bit_adder port map(x=>a(9),y=>b(9),cin=>c9,sum=>z(9),cout=>c10); 
    FA10 : One_bit_adder port map(x=>a(10),y=>b(10),cin=>c10,sum=>z(10),cout=>c11); 
    FA11 : One_bit_adder port map(x=>a(11),y=>b(11),cin=>c11,sum=>z(11),cout=>c12);
    FA12 : One_bit_adder port map(x=>a(12),y=>b(12),cin=>c12,sum=>z(12),cout=>c13); 
    FA13 : One_bit_adder port map(x=>a(13),y=>b(13),cin=>c13,sum=>z(13),cout=>c14); 
    FA14 : One_bit_adder port map(x=>a(14),y=>b(14),cin=>c14,sum=>z(14),cout=>c15); 
    FA15 : One_bit_adder port map(x=>a(15),y=>b(15),cin=>c15,sum=>z(15),cout=>c16); 
    FA16 : One_bit_adder port map(x=>a(16),y=>b(16),cin=>c16,sum=>z(16),cout=>c17); 
    FA17 : One_bit_adder port map(x=>a(17),y=>b(17),cin=>c17,sum=>z(17),cout=>c18); 
    FA18 : One_bit_adder port map(x=>a(18),y=>b(18),cin=>c18,sum=>z(18),cout=>c19); 
    FA19 : One_bit_adder port map(x=>a(19),y=>b(19),cin=>c19,sum=>z(19),cout=>c20); 
    FA20 : One_bit_adder port map(x=>a(20),y=>b(20),cin=>c20,sum=>z(20),cout=>c21); 
    FA21 : One_bit_adder port map(x=>a(21),y=>b(21),cin=>c21,sum=>z(21),cout=>c22); 
    FA22 : One_bit_adder port map(x=>a(22),y=>b(22),cin=>c22,sum=>z(22),cout=>c23); 
    FA23 : One_bit_adder port map(x=>a(23),y=>b(23),cin=>c23,sum=>z(23),cout=>c24); 
    FA24 : One_bit_adder port map(x=>a(24),y=>b(24),cin=>c24,sum=>z(24),cout=>c25); 
    FA25 : One_bit_adder port map(x=>a(25),y=>b(25),cin=>c25,sum=>z(25),cout=>c26); 
    FA26 : One_bit_adder port map(x=>a(26),y=>b(26),cin=>c26,sum=>z(26),cout=>c27); 
    FA27 : One_bit_adder port map(x=>a(27),y=>b(27),cin=>c27,sum=>z(27),cout=>c28); 
    FA28 : One_bit_adder port map(x=>a(28),y=>b(28),cin=>c28,sum=>z(28),cout=>c29); 
    FA29 : One_bit_adder port map(x=>a(29),y=>b(29),cin=>c29,sum=>z(29),cout=>c30); 
    FA30 : One_bit_adder port map(x=>a(30),y=>b(30),cin=>c30,sum=>z(30),cout=>c31); 
    FA31 : One_bit_adder port map(x=>a(31),y=>b(31),cin=>c31,sum=>z(31),cout=>cout);     
end Behavioral;
