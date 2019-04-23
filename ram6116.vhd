----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2019 07:45:28 AM
-- Design Name: 
-- Module Name: ram6116 - Behavioral
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

entity ram6116 is
    generic (constant t_AA: Time := 120 ns; --Address Access Time
        constant t_ACS: Time := 120 ns; --Chip Select Access Time
        constant t_CLZ: Time := 10 ns; --Chip Select to Output in low-Z
        constant t_CHZ: Time := 10 ns; --Chip de-select to output in high-Z
        constant t_OH: Time := 10 ns; --Output hold from address change
        constant t_WC: Time := 120 ns; --Write Cycle Time
        constant t_AW: Time := 105 ns; --Address valid to end of write
        constant t_WP: Time := 70 ns; --Write pulse width
        constant t_WHZ: Time := 35 ns; --Write enable to output in high-Z
        constant t_DW: Time := 35 ns; --Data valid to end of write
        constant t_DH: Time := 0 ns; --Data hold from end of write
        constant t_OW: Time := 10 ns); --Output active from end of write

    Port(address: in unsigned(5 downto 0);
        data: inout std_logic_vector(5 downto 0);
        WE_b, CS_b, OE_b: in std_ulogic
    );
end entity ram6116;

architecture SRAM of ram6116 is
    type ram_type is array(0 to 2**6) of std_logic_vector(5 downto 0);
    signal ram1: ram_type := (others => (others => '0'));

begin
    process
    begin
        if (rising_edge(WE_b) and CS_b'delayed = '0')
            or (rising_edge(CS_b) and WE_b'delayed = '0') then
            -- write
            ram1(conv_integer(address'delayed)) <= data'delayed;
            -- data'delayed is the value of data just before the falling_edge
            data <= transport data'delayed after t_OW;
        end if;
        if (falling_edge(WE_b) and CS_b = '0') then
            -- enter write mode
            data <= transport "ZZZZZZZZ" after t_WHZ;
        end if;
        if CS_b'event and OE_b = '0' then
            if CS_b = '1' then -- RAM is de-selected
                data <= transport "ZZZZZZZZ" after t_CHZ;
            elsif WE_b = '1' then -- read
                data <= "XXXXXXXX" after t_CLZ;
                data <= transport ram1((conv_integer(address)) after t_ACS;
            end if;
        end if;
        if address'event and CS_b = '0' and OE_b = '0' and WE_b = '1'
        then
            data <= "XXXXXXXX" after t_OH;
            data <= transport ram1(conv_integer(address)) after t_AA;
        end if;
        wait on CS_b, WE_b, address;
    end process;
      
    check: process
    begin
        if CS_b'delayed = '0' and NOW /= 0 ns then
            if address'event then
                assert (address'delayed'stable(t_WC)) --Read Cycle Time = t_WC
                    report "address cycle is too short"
                    severity WARNING;
            end if;
            if rising_edge(WE_b) then
                assert (address'delayed'stable(t_AW))
                report "address not long enough to end of write"
                severity WARNING;
                assert (WE_b'delayed'stable(t_WP))
                report "write pulse is too short" severity WARNING;
                assert (data'delayed'stable(t_DW))
                report "data setup time is too short" severity WARNING;
                wait for t_DH;
                assert (data'last_event >= t_DH)
                report "data hold time is too short" severity WARNING;
            end if;
        end if;
        wait on WE_b, address, CS_b;
    end process check;           
     
end architecture SRAM;
