library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


component ripple_carry_adder
	Port (A : in STD_LOGIC_vector(3 downto 0);
	      B : in STD_LOGIC_vector(3 downto 0);
	      S : out STD_LOGIC_vector(3 downto 0);
	      COUT : out STD_LOGIC_vector;
	      QP_SEL : in STD_LOGIC_vector;
end component;

architecture Behavioral of Ripple_Adder is

signal a: std_logic_vector (3 downto 0) := "0000";
signal b: std_logic_vector (3 downto 0) := "0000";
signal op_sel: std_logic := '0';

signal s: std_logic_vector (3 downto 0) := "0000";
signal cout: std_logic;

begin

uut: ripple_carry_adder
	port map(
		   A => a,
		   B => b,
		   S => s,
		   COUT => cout,  
		   OP_SEL => op_sel
 		);

simu : process

begin

a <= "1110";
b <= "0110";
op_sel <= '1';
wait for 100ns;

a <= "1110";
b <= "0110";
op_sel <= '0';
wait for 100ns;

--new test cases
a <= "0001";
b <= "0001";
op_sel <= '0';
wait for 100ns;

a <= "0010";
b <= "0001";
op_sel <= '1';
wait for 100ns;

a <= "0110";
b <= "0100";
op_sel <= '0';
wait for 100ns;

a <= "0110";
b <= "0100";
op_sel <= '1';
wait for 100ns;

end process;

end Behavioral;