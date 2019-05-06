----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Alex Clark
-- Create Date: 04/09/2019 12:59:18 PM
-- Design Name: 
-- Module Name: ALU_simple - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  The 32-bit ALU that performs AND, OR, ADD, and SUB
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

entity ALU_simple is
Port ( 
a,b : in std_logic_vector (31 downto 0);
bin : in std_logic;
cin : in std_logic;
op : in std_logic_vector(1 downto 0);
z : out std_logic_vector(31 downto 0);
cout : out std_logic;
zeroflag : out std_logic
);
end ALU_simple;

architecture Behavioral of ALU_simple is
signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31 : std_logic;
signal ztemp, bIntemp : std_logic_vector(31 downto 0);

    component One_bit_ALU
        port(
        a,b,cin : in std_logic;
        bin : in std_logic;
        op: in std_logic_vector(1 downto 0);
        result,cout   : out std_logic
        );
    end component;
begin

--process
--begin
--if bin = '1' then
--for i in 0 to 31 loop
--    bInTemp(i) <= '1';
--        wait for 1 ns;
--end loop;
--else
--for i in 0 to 31 loop
--   bInTemp(i) <= '0';
--    wait for 1 ns;
--end loop;
--end if;
--end process;

   

SA0 : One_bit_ALU port map(a=>a(0),b=>b(0),cin=>cin,bin=>bin,op=>op,result=>ztemp(0),cout=>c1);
SA1 : One_bit_ALU port map(a=>a(1),b=>b(1),cin=>c1,bin=>bin,op=>op,result=>ztemp(1),cout=>c2);
SA2 : One_bit_ALU port map(a=>a(2),b=>b(2),cin=>c2,bin=>bin,op=>op,result=>ztemp(2),cout=>c3);
SA3 : One_bit_ALU port map(a=>a(3),b=>b(3),cin=>c3,bin=>bin,op=>op,result=>ztemp(3),cout=>c4);
SA4 : One_bit_ALU port map(a=>a(4),b=>b(4),cin=>c4,bin=>bin,op=>op,result=>ztemp(4),cout=>c5);
SA5 : One_bit_ALU port map(a=>a(5),b=>b(5),cin=>c5,bin=>bin,op=>op,result=>ztemp(5),cout=>c6);
SA6 : One_bit_ALU port map(a=>a(6),b=>b(6),cin=>c6,bin=>bin,op=>op,result=>ztemp(6),cout=>c7);
SA7 : One_bit_ALU port map(a=>a(7),b=>b(7),cin=>c7,bin=>bin,op=>op,result=>ztemp(7),cout=>c8);
SA8 : One_bit_ALU port map(a=>a(8),b=>b(8),cin=>c8,bin=>bin,op=>op,result=>ztemp(8),cout=>c9);
SA9 : One_bit_ALU port map(a=>a(9),b=>b(9),cin=>c9,bin=>bin,op=>op,result=>ztemp(9),cout=>c10);
SA10 : One_bit_ALU port map(a=>a(10),b=>b(10),cin=>c10,bin=>bin,op=>op,result=>ztemp(10),cout=>c11);
SA11 : One_bit_ALU port map(a=>a(11),b=>b(11),cin=>c11,bin=>bin,op=>op,result=>ztemp(11),cout=>c12);
SA12 : One_bit_ALU port map(a=>a(12),b=>b(12),cin=>c12,bin=>bin,op=>op,result=>ztemp(12),cout=>c13);
SA13 : One_bit_ALU port map(a=>a(13),b=>b(13),cin=>c13,bin=>bin,op=>op,result=>ztemp(13),cout=>c14);
SA14 : One_bit_ALU port map(a=>a(14),b=>b(14),cin=>c14,bin=>bin,op=>op,result=>ztemp(14),cout=>c15);
SA15 : One_bit_ALU port map(a=>a(15),b=>b(15),cin=>c15,bin=>bin,op=>op,result=>ztemp(15),cout=>c16);
SA16 : One_bit_ALU port map(a=>a(16),b=>b(16),cin=>c16,bin=>bin,op=>op,result=>ztemp(16),cout=>c17);
SA17 : One_bit_ALU port map(a=>a(17),b=>b(17),cin=>c17,bin=>bin,op=>op,result=>ztemp(17),cout=>c18);
SA18 : One_bit_ALU port map(a=>a(18),b=>b(18),cin=>c18,bin=>bin,op=>op,result=>ztemp(18),cout=>c19);
SA19 : One_bit_ALU port map(a=>a(19),b=>b(19),cin=>c19,bin=>bin,op=>op,result=>ztemp(19),cout=>c20);
SA20 : One_bit_ALU port map(a=>a(20),b=>b(20),cin=>c20,bin=>bin,op=>op,result=>ztemp(20),cout=>c21);
SA21 : One_bit_ALU port map(a=>a(21),b=>b(21),cin=>c21,bin=>bin,op=>op,result=>ztemp(21),cout=>c22);
SA22 : One_bit_ALU port map(a=>a(22),b=>b(22),cin=>c22,bin=>bin,op=>op,result=>ztemp(22),cout=>c23);
SA23 : One_bit_ALU port map(a=>a(23),b=>b(23),cin=>c23,bin=>bin,op=>op,result=>ztemp(23),cout=>c24);
SA24 : One_bit_ALU port map(a=>a(24),b=>b(24),cin=>c24,bin=>bin,op=>op,result=>ztemp(24),cout=>c25);
SA25 : One_bit_ALU port map(a=>a(25),b=>b(25),cin=>c25,bin=>bin,op=>op,result=>ztemp(25),cout=>c26);
SA26 : One_bit_ALU port map(a=>a(26),b=>b(26),cin=>c26,bin=>bin,op=>op,result=>ztemp(26),cout=>c27);
SA27 : One_bit_ALU port map(a=>a(27),b=>b(27),cin=>c27,bin=>bin,op=>op,result=>ztemp(27),cout=>c28);
SA28 : One_bit_ALU port map(a=>a(28),b=>b(28),cin=>c28,bin=>bin,op=>op,result=>ztemp(28),cout=>c29);
SA29 : One_bit_ALU port map(a=>a(29),b=>b(29),cin=>c29,bin=>bin,op=>op,result=>ztemp(29),cout=>c30);
SA30 : One_bit_ALU port map(a=>a(30),b=>b(30),cin=>c30,bin=>bin,op=>op,result=>ztemp(30),cout=>c31);
SA31 : One_bit_ALU port map(a=>a(31),b=>b(31),cin=>c31,bin=>bin,op=>op,result=>ztemp(31),cout=>cout);

z <= ztemp;
zeroflag <= '1' when(ztemp = "00000000000000000000000000000000") else
            '0';

end Behavioral;
