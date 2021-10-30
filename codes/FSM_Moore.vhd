library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

entity FSM_Moore is
    port (
        w, clk, rst : in std_logic;
        y      : out std_logic
    );
end FSM_Moore;


architecture logic of FSM_Moore is
    TYPE state_type is (A,B,C,D,E);
    signal current_state : state_type;
begin

    FSM_PROC1 : process(clk, w, rst)
    begin
        if rst = '0' then current_state <= A;
        elsif rising_edge(clk) then
            case current_state is
                when A => if w = '0' then current_state <= B; else current_state <= A end if; 
                when B => if w = '0' then current_state <= B; else current_state <= C end if; 
                when C => if w = '0' then current_state <= B; else current_state <= D end if; 
                when D => if w = '0' then current_state <= B; else current_state <= E end if; 
                when E => if w = '0' then current_state <= B; else current_state <= A end if; 
        end if;
    end process;

    y <= '1' when (current_state = E and w = '1') else '0';

end architecture;
