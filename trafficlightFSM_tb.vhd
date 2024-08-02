library ieee;
use ieee.std_logic_1164.all;

entity trafficlightFSM_tb is
end trafficlightFSM_tb;

architecture Behavioral of trafficlightFSM_tb is

component trafficControlFSM
	port( clk:  in std_logic;
	      ns_r, ns_y, ns_g,
	      ew_r, ew_y, ew_g : out std_logic);
end component;

signal ns_r, ns_y, ns_g, ew_r, ew_y, ew_g : std_logic;
signal clk: std_logic := '1';

begin

	uut: trafficControlFSM
	port map( ns_r => ns_r,
		  ns_g => ns_g,
		  ns_y => ns_y,
		  ew_r => ew_r,
		  ew_g => ew_g,
		  ew_y => ew_y,
		  clk => clk);
	clock : process is
	begin
	clk <= '0'; wait for 5ns;
	clk <= '1'; wait for 5ns;
	-- clock period is 10ns
	end process clock;

end Behavioral;