----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2019 02:58:33 AM
-- Design Name: 
-- Module Name: Top_Memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Memory is
  Port ( 
  ck: in std_logic;
  led   : OUT STD_LOGIC_VECTOR (7 downto 0) --NEW CODE
);
end Top_Memory;

architecture Behavioral of Top_Memory is

	signal instr_address: std_logic_vector(31 downto 0); -- Address of the instruction to run
	signal next_address: std_logic_vector(31 downto 0); -- Next address to be loaded into PC
	signal instruction: std_logic_vector(31 downto 0); -- The actual instruction to run
	signal read_data_1, read_data_2, write_data, extended_immediate, shifted_immediate, alu_in_2, alu_result, last_instr_address, incremented_address, add2_result, mux4_result, concatenated_pc_and_jump_address, mem_read_data: std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- vhdl does not allow me to port map " y => incremented_address(31 downto 28) & shifted_jump_address "
	signal shifted_jump_address: std_logic_vector(27 downto 0);
	signal jump_address: std_logic_vector(25 downto 0);
	signal immediate: std_logic_vector(15 downto 0);
	signal opcode, funct: std_logic_vector(5 downto 0);
	signal rs, rt, rd, shampt, write_reg: std_logic_vector(4 downto 0);
	signal alu_control_fuct: std_logic_vector(3 downto 0);
	signal reg_dest, jump, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, alu_zero, branch_and_alu_zero: std_logic:= '0'; -- vhdl does not allow me to port map " s => (branch and alu_zero) "
	signal alu_op: std_logic_vector(1 downto 0);

	type state is (loading, running, done);
	signal s: state:= loading;
	
    signal en: std_logic:= '0';
    
    component memory is
    port (
        address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
        MemWrite, MemRead,ck: in STD_LOGIC;
        read_data: out STD_LOGIC_VECTOR (31 downto 0);
        led_data: out STD_LOGIC_VECTOR (7 downto 0) --NEW CODE
    );
    end component;
	
begin

MEM: memory port map (
		address => alu_result,
		write_data => read_data_2,
		MemWrite => mem_write,
		MemRead => mem_read,
		ck => en,
		read_data => mem_read_data,
		led_data => led(7 downto 0) --NEW CODE
	);

end Behavioral;
