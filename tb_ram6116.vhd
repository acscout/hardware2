----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2019 08:32:29 AM
-- Design Name: 
-- Module Name: tb_ram6116 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_ram6116 is
--  Port ( );
end tb_ram6116;

architecture Behavioral of tb_ram6116 is

component ram6116 is
    Port(address: in unsigned(5 downto 0);
        data: inout std_logic_vector(5 downto 0);
        WE_b, CS_b, OE_b: in std_ulogic
    );
end component;

SIGNAL address_input : unsigned(5 DOWNTO 0);
SIGNAL data_input : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL write : STD_ULOGIC;
SIGNAL output : STD_ULOGIC;
SIGNAL chip_select : STD_ULOGIC;

begin
    
write <= '0'; --write is enabled
chip_select <= '1'; --rising edge of clock
output <= '1'; --output not enabled for simulation

address_input(5 downto 0) <= "000000";
data_input(5 downto 0) <= "010101";

u1: ram6116
    port map(
        address => address_input,
        data => data_input,
        WE_b => write,
        OE_b => output,
        CS_b => chip_select
    );

end Behavioral;
