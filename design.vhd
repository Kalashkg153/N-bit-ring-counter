library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- STructurally
entity Structural_Ring_Counter is
generic ( N : integer:=4 );
port ( 
 CLK: in std_logic; -- clock
 RESET: in std_logic; -- reset
 Q_OUT: out std_logic_vector(N-1 downto 0) -- output
 
 );
end Structural_Ring_Counter;

architecture structural of Structural_Ring_Counter is
signal not_QN: std_logic;
signal D,Q : std_logic_vector(N-1 downto 0):=(others => '0');
begin
-- fpga4student.com FPGA projects, VHDL projects, Verilog projects
 N_BIT_Ring_counter : for i in 0 to N-1 generate
    begin
        F0 : if ( i = 0 ) generate   -- First DFF
            begin U1 : entity work.DFF port map       
            ( 
 Q => Q(0),
 CLK => CLK,
 RESET => RESET,
 D => not_QN
 );
 end generate F0;
        F1 : if ( i /= 0 ) generate  -- The rest of DFFs
            begin U2 : entity work.DFF port map   
 (
 Q => Q(i),
 CLK => CLK,
 RESET => RESET,
 D => Q(i-1)
 );
 end generate F1;
    end generate N_BIT_Ring_counter;     
  not_QN <= not Q(N-1);
  Q_OUT <= Q;
end structural;
