----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:57 05/27/2016 
-- Design Name: 
-- Module Name:    MUX_REG - Behavioral 
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

entity MUX_REG is
    Port ( DI0 : in  STD_LOGIC_VECTOR (4 downto 0);
           DI1 : in  STD_LOGIC_VECTOR (4 downto 0);
           SelData : in  STD_LOGIC;
           DO : out  STD_LOGIC_VECTOR (4 downto 0));
end MUX_REG;

architecture Behavioral of MUX_REG is

begin


end Behavioral;

