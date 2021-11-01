library ieee;
use ieee.std_logic_1164.all;


entity mealy is 
port(clk,rst,w : in std_logic;
	y : out std_logic);
end mealy ;

architecture behavior of mealy is 
type state_type is (A,B,C,D,E);
signal ps : state_type;

begin
p1: process(clk,rst,PS)

begin
if rst= '1' then ps <= A;
elsif(clk' event and clk = '0')then 

case ps is 
when A => if w = '0' then ps <= B ; else ps <= A ; end if;
when B => if w = '0' then ps <= B ; else ps <= C ; end if;
when C => if w = '0' then ps <= D ; else ps <= A ; end if;
when D => if w = '0' then ps <= B ; else ps <= E ; end if;
when E => if w = '0' then ps <=D; else ps <= A ; end if;

end case;
end if;
end process p1;
Y <= '1' when (ps = E and w = '1') else '0';

end behavior;