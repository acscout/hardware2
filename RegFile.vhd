------------------------------------------------------
-- Register Memory Block
-- 
-- Contains all the registers.
-- 
-- Memory is kept in rows of 32 bits to represent 32-bit
-- registers.
------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegFile is 
	port (
        ck: in std_logic;
		write_enabled: in std_logic;
		read_reg_1: in std_logic_vector(4 downto 0);
		read_reg_2: in std_logic_vector(4 downto 0);
		write_reg: in std_logic_vector(4 downto 0);
		write_data: in std_logic_vector(31 downto 0);
		read_data_1: out std_logic_vector(31 downto 0);
		read_data_2: out std_logic_vector(31 downto 0)
	);
end RegFile;

architecture Behavorial of RegFile is

    -- 128 byte register memory (32 rows * 4 bytes/row)
    type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal reg_mem: mem_array := (
        "00000000000000000000000000000000",--hard code (delete these)
        "00000000000000000000000000000001", 
        "00000000000000000000000000000101",
        "00000000000000000000000000001001",
        "00000000000000000000000000001001",
        "00000000000000000000000000010010",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000"
    );

	begin

    read_data_1 <= reg_mem(to_integer(unsigned(read_reg_1)));
    read_data_2 <= reg_mem(to_integer(unsigned(read_reg_2)));

    process(ck)
        begin
        if ck='0' and ck'event and write_enabled='1' then
            reg_mem(to_integer(unsigned(write_reg))) <= write_data;
        end if;
    end process;
end Behavorial;