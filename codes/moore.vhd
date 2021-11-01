library ieee;
use ieee.std_logic_1164.all;


entity moore is 
port(clk,rst,w : in std_logic;
	y : out std_logic);
end moore ;

architecture behavior of moore is 
type state_type is (A,B,C,D,E);
signal ps : state_type;

begin
p1: process(clk,rst,ps)

begin
if rst= '0' then ps <= A;
elsif(clk' event and clk = '1')then 

case ps is 
when A => if w = '0' then ps <= B ; else ps <= A ; end if;
when B => if w = '0' then ps <= B ; else ps <= C ; end if;
when C => if w = '0' then ps <= B ; else ps <= D ; end if;
when D => if w = '0' then ps <= B ; else ps <= E ; end if;
when E => if w = '0' then ps <= B ; else ps <= A ; end if;
end case;
end if;
end process p1;
Y <= '1' when (ps = E) else '0';

end behavior;