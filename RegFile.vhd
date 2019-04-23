----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2019 10:49:28 AM
-- Design Name: 
-- Module Name: RegFile - Behavioral
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
use IEEE.NUMERIC_STD.ALL;  -- NEED TO USE THE COMPONENTS WE HAVE BUILT INSTEAD OF LIB-------------------

entity RegFile is
  Port  ( reg1        : in  STD_LOGIC_VECTOR (4 downto 0);  -- takes instr 25-21
          reg2        : in  STD_LOGIC_VECTOR (4 downto 0);  -- takes instr 20-16
          write_reg   : in  STD_LOGIC_VECTOR (4 downto 0);  -- to write to reg to mem unit
          write_data  : in  STD_LOGIC_VECTOR (31 downto 0); -- 
          write_en    : in  STD_LOGIC;                      -- enables 'write_reg' and 'write_data'
          clk         : in std_logic;                       -- clock (write_en is checked on rising clock edge)
          
          data1       : out STD_LOGIC_VECTOR (31 downto 0); -- used for adder 'A'
          data2       : out STD_LOGIC_VECTOR (31 downto 0) -- adder 'B' or save to mem
          
          );
end RegFile;




architecture Behavioral of RegFile is
    -- setting up reg block of 32 registers each with 32 bits. each is init with '0..0'
    type reg_a is array (0 to 31) of 
    STD_LOGIC_VECTOR (31 downto 0);
    signal reg_block : reg_a :=(
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
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000"
    );
begin
    data1 <= reg_block(to_integer(unsigned(reg1)));
    data2 <= reg_block(to_integer(unsigned(reg2)));

    process(clk)
        begin
        -- write to mem reg is rising clk edge and write is enabled
        if(clk = '1')then
          if (clk'event = '1') then
          if (write_en = '1') then
            reg_block(to_integer(unsigned(write_reg))) <= write_data;
        end if;
    end process;
end process;
end Behavioral;
