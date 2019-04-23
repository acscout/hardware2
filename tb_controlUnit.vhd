----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2019 05:58:43 PM
-- Design Name: 
-- Module Name: tb_controlUnit - Behavioral
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

entity tb_controlUnit is
--  Port ( );
end tb_controlUnit;

architecture Behavioral of tb_controlUnit is

component top_controlUnit is
    Port (
        reset: in STD_LOGIC;
        opcode: in STD_LOGIC_VECTOR(5 downto 0);
        regDst: out STD_LOGIC;
        jump  : out STD_LOGIC;
        branch: out STD_LOGIC;
        memRead: out STD_LOGIC;
        memToReg: out STD_LOGIC;
        ALUOp: out STD_LOGIC_VECTOR(1 downto 0);
        memWrite: out STD_LOGIC;
        ALUScr : out STD_LOGIC;
        regWrite: out STD_LOGIC
    );
end component;

signal reset: STD_LOGIC;
signal opcode: STD_LOGIC_VECTOR(5 downto 0) :=(others=>'1');
signal regDst: STD_LOGIC := '0';
signal jump  : STD_LOGIC := '0';
signal branch: STD_LOGIC := '0';
signal memRead: STD_LOGIC := '0';
signal memToReg: STD_LOGIC := '0';
signal ALUOp: STD_LOGIC_VECTOR(1 downto 0) :=(others=>'1');
signal memWrite: STD_LOGIC := '0';
signal ALUScr : STD_LOGIC := '0';
signal regWrite: STD_LOGIC := '0';

begin
 u1: top_controlUnit
    PORT MAP (
        reset=>reset,
        opcode=>opcode,
        regDst=>regDst,
        jump=>jump,
        branch=>branch,
        memRead=>memRead,
        memToReg=>memToReg,
        ALUOp=>ALUOp,
        memWrite=>memWrite,
        ALUScr=>ALUScr,
        regWrite=>regWrite
    );
process
    begin
        wait for 10 ns;
        opcode<="100000";
        wait for 10 ns;
        opcode<="100010";
        wait for 10 ns;
        opcode<="100100";
        wait for 10 ns;
        opcode<="100101";
        wait for 10 ns;
        opcode<="000000";
        wait for 10 ns;
        opcode<="000010";
        wait for 10 ns;
        opcode<="101010";
        wait for 10 ns;
        opcode<="001000";
        wait for 10 ns;
        opcode<="001101";
        wait for 10 ns;
        opcode<="001111";
        wait for 10 ns;
        opcode<="100011";
        wait for 10 ns;
        opcode<="101011";
        wait for 10 ns;
        opcode<="000100";
        wait for 10 ns;
        opcode<="000011";
        
end process;
    
end Behavioral;
