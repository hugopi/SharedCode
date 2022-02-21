----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:42 02/21/2022 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( rst, clockIn : in std_logic;
				clockOut: out std_logic
           );
end clock_divider;

architecture Behavioral of clock_divider is

signal count: integer:=1;
signal flip : std_logic := '0';

process(clk,reset)
begin

if(reset='1') then
	count<=1;
	tmp<='0';
elsif(clk'event and clk='1') then
	count <=count+1;
if (count = 25000) then
	flip <= NOT flip;
	count <= 1;
end if;
end if;

clock_out <= flip;
end process;

end Behavioral;

