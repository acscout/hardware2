----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
--  Alex Clark
-- Create Date: 04/09/2019 12:54:33 PM
-- Design Name: 
-- Module Name: ALU_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
--  The control file for the ALU that calls all components
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

entity ALU_top is
Port ( 
a,b : in std_logic_vector (31 downto 0);
func: in std_logic_vector(5 downto 0);
ALUop : in std_logic_vector(1 downto 0);
z : out std_logic_vector(31 downto 0);
overflow : out std_logic;
cout : out std_logic;
zeroflag : out std_logic
);
end ALU_top;

architecture Behavioral of ALU_top is
 component ALU_simple 
       port(
       a,b : in std_logic_vector (31 downto 0);
       cin : in std_logic;
       bin : in std_logic;
       op : in std_logic_vector(1 downto 0);
       z : out std_logic_vector(31 downto 0);
       cout : out std_logic;
       zeroflag : out std_logic
       );
   end component;
 component Shifting_entity
        port(
        a : in std_logic_vector (31 downto 0);
        dir : in std_logic;
        z : out std_logic_vector (31 downto 0)
        );
 end component;
 component MSB_unit
    port (
    func : in std_logic_vector(5 downto 0);
    ALUop : in std_logic_vector(1 downto 0);
    bin,opShift: out std_logic;
    opALU : out std_logic_vector(1 downto 0);
    outputControl : out std_logic_vector(1 downto 0)
    );
 end component;
 component Overflow_unit
 Port ( 
 overflowTemp : in std_logic;
 func : in std_logic_vector(5 downto 0);
 overflow : out std_logic
 );
 end component;
signal outputControl,opALU : std_logic_vector(1 downto 0);
signal opShift,coutTemp,bin,zeroflagTemp,skip: std_logic;
signal ALUz, Shiftz, SLTz,ztemp : std_logic_vector(31 downto 0);
begin


--opALU <= op(1 downto 0);
--opShift <= op(2);
--outputControl <= op(4 downto 3);

SMSB : MSB_unit port map(func=>func,ALUop=>ALUop,bin=>bin,opALU=>opALU,outputControl=>outputControl,opShift=>opShift); 
SA: ALU_simple port map(a=>a,b=>b,cin=>bin,bin=>bin,op=>opALU,z=>ALUz,cout=>coutTemp,zeroflag=>zeroflagTemp);
SS: Shifting_entity port map(a=>a,dir=>opShift,z=>Shiftz);
SO: Overflow_unit port map(overflowTemp=>coutTemp,func=>func,overflow=>overflow); 
 
--process
--begin
--for i in 0 to 31 loop
--    SLTz(i) <= coutTemp;
--    wait for 1 ns;
--end loop;
--end process; 
SLTz <= "00000000000000000000000000000000" when (coutTemp = '1') else
        "00000000000000000000000000000000" when (zeroflagTemp = '1') else
        "00000000000000000000000000000001";
 
cout <= coutTemp; 
--overflow <= coutTemp;   
ztemp <= b  when (outputControl = "00") else
         ALUz when (outputControl = "10") else
         Shiftz when (outputControl = "01") else
         SLTz; 
         
z <= ztemp;
zeroflag <= '1' when(ztemp = "00000000000000000000000000000000") else
                 '0';
end Behavioral;
