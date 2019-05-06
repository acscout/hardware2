----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2019 01:41:02 PM
-- Design Name: 
-- Module Name: Instruction_memory - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity instruction_memory is -- read only
    port ( 
		addr_in : in std_logic_vector(31 downto 0); -- we use only 6 bits though here;
		instr_out : out std_logic_vector(31 downto 0) );
end instruction_memory;

architecture behavioral_arch of instruction_memory is

begin	   
	
	instr_mem_process: process (addr_in) is
		variable var_addr : integer;
	begin 
		-- hard coded contents of the instruction memory; this
		-- is supposed to implement the program you want the SCC to execute!	
		-- 	
		-- simple program: bring 1 from data mem loc 0 (hard coded therein)	and place in R4
		-- then add it with const. 3 to get 4 and place in R5; then add R5 and R4
		-- that is 4 + 3 = 7 and place in R6; finally store R6 into mem loc 1;
		-- so, finally data mem loc 1 should contain the result 7;
		--
		--  LD   $4, $0      -  R[4] <- M[R[0]], load $4 with 1 (that is data from mem location $0, which is location 0)
		--  ADDI $5, $4, 3   -  R[5] <- R[4] + 3, add 1 + 3 and place in $5
		--  ADD  $6, $5, $4  -  R[6] <- R[5] + R[4], add 4 + 1 and place in $6
		--  ST   $4, $6      -  M[R[4]] <- R[6], store data from $6 (that is value 5) into mem location $1, which is address 1

		var_addr := conv_integer(addr_in(7 downto 2));
		case var_addr is
			when 0  => instr_out <= "10001100001000000000000000000000";--"100011 00001 00000 0000000000000000"--"0010000100000000"; -- 0010000 100 000 000
			when 1  => instr_out <= "10001100010000010000000000000001";--"100011 00010 00001 0000000000000001"--"1000010101100011"; -- 1000010 101 100 011
			when 2  => instr_out <= "10001100011000100000000000000010";--"100011 00011 00010 0000000000000010"--"0000010110101100"; -- 0000010 110 101 100
			when 3  => instr_out <= "10000000001000100111000000000011";--"100000 00001 00010 01110 00000000011"--"0100000100110000"; -- 0100000 100 110 000
			when 4  => instr_out <= "10000000001000100111100000000011";--"100000 00001 00010 01111 00000000011"--X"FFFF"; -- stop execution;
			when 5  => instr_out <= "00010000100000110000000000000010";--"000100 00100 00011 0000000000000010"
			when 6  => instr_out <= "10000000011001000010100000000011";--"100000 00011 00100 00101 00000000011"
			when 7  => instr_out <= "10101100100001010000000000000101";--"101011 00100 00101 0000000000000101"
			when 8  => instr_out <= "10001100011001000000000000000100";--"100011 00110 00100 0000000000000100"
			when 9  => instr_out <= X"FFFFFFFF";
			when 10 => instr_out <= X"00000000";
			when 11 => instr_out <= X"00000000";
			when 12 => instr_out <= X"00000000";
			when 13 => instr_out <= X"00000000";
			when 14 => instr_out <= X"00000000";
			when 15 => instr_out <= X"00000000";
			when 16 => instr_out <= X"00000000";
            when 17 => instr_out <= X"00000000";
            when 18 => instr_out <= X"00000000";
            when 19 => instr_out <= X"00000000";
            when 20 => instr_out <= X"00000000";
            when 21 => instr_out <= X"00000000";
            when 22 => instr_out <= X"00000000";
            when 23 => instr_out <= X"00000000";
            when 24 => instr_out <= X"00000000";
            when 25 => instr_out <= X"00000000";
            when 26 => instr_out <= X"00000000";
            when 27 => instr_out <= X"00000000";
            when 28 => instr_out <= X"00000000";
            when 29 => instr_out <= X"00000000";
            when 30 => instr_out <= X"00000000";
            when 31 => instr_out <= X"00000000";
            when 32 => instr_out <= X"00000000";
            when 33 => instr_out <= X"00000000";
            when 34 => instr_out <= X"00000000";
            when 35 => instr_out <= X"00000000";
            when 36 => instr_out <= X"00000000";
            when 37 => instr_out <= X"00000000";
            when 38 => instr_out <= X"00000000";
            when 39 => instr_out <= X"00000000";
            when 40 => instr_out <= X"00000000";
            when 42 => instr_out <= X"00000000";
            when 43 => instr_out <= X"00000000";
            when 44 => instr_out <= X"00000000";
            when 45 => instr_out <= X"00000000";
            when 46 => instr_out <= X"00000000";
            when 47 => instr_out <= X"00000000";
            when 48 => instr_out <= X"00000000";
            when 49 => instr_out <= X"00000000";
            when 50 => instr_out <= X"00000000";
            when 51 => instr_out <= X"00000000";
            when 52 => instr_out <= X"00000000";
            when 53 => instr_out <= X"00000000";
            when 54 => instr_out <= X"00000000";
            when 55 => instr_out <= X"00000000";
            when 56 => instr_out <= X"00000000";
            when 57 => instr_out <= X"00000000";
            when 58 => instr_out <= X"00000000";
            when 59 => instr_out <= X"00000000";
            when 60 => instr_out <= X"00000000";
            when 61 => instr_out <= X"00000000";
            when 62 => instr_out <= X"00000000";
            when 63 => instr_out <= X"00000000";
            when 64 => instr_out <= X"00000000";
			when others =>  
				instr_out <= X"00000000";
		end case;
	end process;
  
end behavioral_arch;

