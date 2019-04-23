----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2019 06:37:37 PM
-- Design Name: 
-- Module Name: top_controlUnit - Behavioral
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

entity top_controlUnit is
Port (
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
end top_controlUnit;

architecture Behavioral of top_controlUnit is

begin
process(opcode)
begin
    
    case opcode is
        --ADD HEX: 20
        when "100000" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --SUB HEX: 22
        when "100010" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --AND HEX: 24  
        when "100100" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --OR HEX: 25  
        when "100101" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
            regWrite <= '0';
        --SLL HEX: 00
        when "000000" =>
            regDst <= '1';
            jump <= '1';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --SRL HEX: 02
        when "000010" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --SLT HEX: 2A
        when "101010" =>
            regDst <= '1';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "10";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '1';
        --JR HEX: 0
       
        --ADDI HEX: 08
        when "001000" =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '1';
            regWrite <= '1';
        --ORI HEX: 13
        when "001101" =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '1';
            regWrite <= '1';
        --LUI HEX: 13
        when "001111" =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '1';
            regWrite <= '1';
        --LW HEX: 23
        when "100011" =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '1';
            memToReg <= '1';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '1';
            regWrite <= '1';
       --SW HEX: 2b 
        when "101011" =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '1';
            ALUScr <= '1';
            regWrite <= '0';
        --BEQ HEX: 4
        when "000100" =>
            regDst <= '0';
            jump <= '0';
            branch <= '1';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "01";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '0';
       --JAL HEX: 4
        when "000011" =>
            regDst <= '0';
            jump <= '1';
            branch <= '0';
            memRead <= '1';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '1';
            regWrite <= '0';
        when others =>
            regDst <= '0';
            jump <= '0';
            branch <= '0';
            memRead <= '0';
            memToReg <= '0';
            ALUOp <= "00";
            memWrite <= '0';
            ALUScr <= '0';
            regWrite <= '0';
    end case;
end process;
end Behavioral;