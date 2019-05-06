----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2019 12:03:03 PM
-- Design Name: 
-- Module Name: data_memory - Behavioral
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

entity data_memory is
    port ( 
		reset : in std_logic;
        clk : in std_logic;
        MW : in std_logic;
        MR : in std_logic;
        data_in : in std_logic_vector(31 downto 0);
        addr_in : in std_logic_vector(31 downto 0); -- we use only 4 bits though here;
        data_out : out std_logic_vector(31 downto 0) );
end data_memory;

architecture behavioral_arch of data_memory is

	type MEM_ARRAY_64x32 is array(0 to 63) of std_logic_vector(31 downto 0);
    signal var_data_mem : MEM_ARRAY_64x32 := ( -- Preload the data with zeros
            X"00000001",X"00000005",X"00000009",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", --10
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", --20
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", --30
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", --40
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", --50
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000",
            X"00000000",X"00000000",X"00000000",X"00000000",X"00000000", -- x60
            X"00000000",X"00000000",X"00000000",
            X"00000014" --PC
        );             
begin  
	
	data_mem_process: process (clk, MW, MR, data_in, addr_in) is
		
		variable var_addr : integer;
	begin
		var_addr := conv_integer(addr_in(5 downto 0));    
			-- desired initial values of the data memory:
			
		if (clk = '1' AND MW = '1') then
			-- synchronous rdata mem write should be done on falling edge
        
             var_data_mem(var_addr) <= data_in;
		    
		end if;
                     
		-- asynchronous continuous read of the data memory location at address var_addr
		if(MR = '1') then
            data_out <= var_data_mem(var_addr);
        else
            data_out <= X"00000000";      
        end if;             
	end process;

end behavioral_arch;
