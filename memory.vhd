--memory unit for project
--implements the led

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;--NEW LIBRARY
entity memory is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead,ck: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0);
        led_data: out STD_LOGIC_VECTOR (7 downto 0) --NEW CODE
	);
end memory;

architecture behavioral of memory is	  

type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);

signal data_mem: mem_array := (
    X"00000000", -- initialize data memory
    X"00000000", -- mem 1
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 10 
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000", -- $t6 = register #14
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",  
    X"00000000", -- mem 20
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 30
    X"00000000");

begin

read_data <= data_mem(conv_integer(address(6 downto 2))) when MemRead = '1' else X"00000000";

mem_process: process(address, write_data,ck)
begin
	if ck = '0' and ck'event then
		if (MemWrite = '1') then
			data_mem(conv_integer(address(6 downto 2))) <= write_data;
		end if;
	end if;
end process mem_process;

-- LED WRITE CODE
led_process: process(ck)
begin
    if ck = '0' and ck'event then
        led_data <= data_mem(14); --8 led correspond with binary stored in data_mem(14)
    end if;
end process led_process;

end behavioral;
