----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2022 14:00:11
-- Design Name: 
-- Module Name: top_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_1 is
    Port ( CLK100MHz : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           SW : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (3 downto 0));
end top_1;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top_1 is

  -- Internal signals between flip-flops
  signal s_ff0 : std_logic;
  signal s_ff1 : std_logic;
  signal s_ff2 : std_logic;
  signal s_ff3 : std_logic;


begin

  --------------------------------------------------------------------
  -- Four instances (copies) of D-type FF entity
  d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => SW,
          q     => s_ff0,
          q_bar => open
      );

  d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff0,
          q     => s_ff1,
          q_bar => open
      );
      
  d_ff_2 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff1,
          q     => s_ff2,
          q_bar => open
      );
  
  d_ff_3 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff2,
          q     => s_ff3,
          q_bar => open
      );

LED(3) <= s_ff3;
LED(2) <= s_ff2;
LED(1) <= s_ff1;
LED(0) <= s_ff0;

end architecture Behavioral;
