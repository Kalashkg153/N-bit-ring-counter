LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- VHDL Testbench code for ring counter
ENTITY tb_counter IS
END tb_counter;

ARCHITECTURE behavior OF tb_counter IS 

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Structural_Ring_Counter
  GENERIC
 ( N : integer:=5);
    PORT(
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         Q_OUT : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

  --Outputs
   signal Q_OUT : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;

BEGIN

   uut: Structural_Ring_Counter 
 generic map 
 (
 N => 5
 )
 PORT MAP (
          CLK => CLK,
          RESET => RESET,
          Q_OUT => Q_OUT
        );

   CLK_process :process
   begin
 CLK <= '0';
 wait for CLK_period/2;
 CLK <= '1';
 wait for CLK_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin 
      -- hold reset state for 100 ns.
 RESET <= '1';
      wait for 100 ns; 
 RESET <= '0';
      wait for CLK_period*10; 

      wait;
   end process;

END;
