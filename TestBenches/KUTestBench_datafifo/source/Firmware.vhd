library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library UNISIM;
use UNISIM.VComponents.all;

use work.Firmware_pkg.all;

entity Firmware is
  PORT (
    CLKIN   : in STD_LOGIC;
    RESET   : in STD_LOGIC;
    INPUT1  : in std_logic_vector(11 downto 0);
    INPUT2  : in std_logic_vector(11 downto 0);
    OUTPUT  : out std_logic_vector(19 downto 0);
    FIFOOUT : out std_logic_vector(17 downto 0)
    );
end Firmware;

architecture Behavioral of Firmware is
  -- Constants
  constant bw_fifo  : integer := 18;
  constant bw_add   : integer := 12;
  constant bw_out   : integer := 20;

  component datafifo_dcfeb_top is
    port (
      wr_clk                    : in  std_logic := '0';
      rd_clk                    : in  std_logic := '0';
      srst                      : in  std_logic := '0';
      prog_full                 : out std_logic := '0';
      wr_rst_busy               : out std_logic := '0';
      rd_rst_busy               : out std_logic := '0';
      wr_en                     : in  std_logic := '0';
      rd_en                     : in  std_logic := '0';
      din                       : in  std_logic_vector(bw_fifo-1 downto 0) := (others => '0');
      dout                      : out std_logic_vector(bw_fifo-1 downto 0) := (others => '0');
      full                      : out std_logic := '0';
      empty                     : out std_logic := '1');
  end component;

  -- Signals for simple addition
  signal input1_buf : std_logic_vector(bw_add-1 downto 0) := (others=> '0');
  signal input2_buf : std_logic_vector(bw_add-1 downto 0) := (others=> '0');
  signal add_res : unsigned(bw_add-1 downto 0) := (others=> '0');
  signal output_buf : std_logic_vector(bw_out-1 downto 0) := (others=> '0');

  -- fifo signals
  signal wr_clk_i                       :   std_logic := '0';
  signal rd_clk_i                       :   std_logic := '0';
  signal srst                           :   std_logic := '0';
  signal prog_full                      :   std_logic := '0';
  signal wr_rst_busy                    :   std_logic := '0';
  signal rd_rst_busy                    :   std_logic := '0';
  signal wr_en                          :   std_logic := '0';
  signal rd_en                          :   std_logic := '0';
  signal din                            :   std_logic_vector(bw_fifo-1 downto 0) := (others => '0');
  signal dout                           :   std_logic_vector(bw_fifo-1 downto 0) := (others => '0');
  signal full                           :   std_logic := '0';
  signal empty                          :   std_logic := '1';

begin

-- Start of the simple addition algorithm
  logic: process (CLKIN)
  begin
    if CLKIN'event and CLKIN='1' then
      -- Pipeline 0 (Buffer for input)
      input1_buf <= INPUT1;
      input2_buf <= INPUT2;
      -- Pipeline 1
      add_res <= unsigned(input1_buf) + unsigned(input2_buf) + unsigned(input1_buf) + unsigned(input2_buf);
      -- Pipeline 2
      output_buf <= std_logic_vector(resize(add_res,bw_out));
      -- Pipeline 3 (Buffer for output)
      OUTPUT <= output_buf;
      -- Assign the input to fifo as the result of addition as well
      -- res_cpy <= add_res;
      din <= std_logic_vector(resize(add_res,bw_fifo));
    end if;
  end process;

---- Clock buffers for testbench ----
  wr_clk_buf: bufg
    PORT map(
      i => CLKIN,
      o => wr_clk_i
      );

  rd_clk_buf: bufg
    PORT map(
      i => CLKIN,
      o => rd_clk_i
      );

------------------
  process(full,CLKIN,RESET)
  begin
    if RESET = '1' then
      wr_en <= '0';
      rd_en <= '0';
    elsif CLKIN'event and empty='1' then
      wr_en <= '1';
      rd_en <= '0';
    end if;
    if rising_edge(full) then
      wr_en <= '0';
      rd_en <= '1';
    elsif falling_edge(full) then
      wr_en <= '1';
      rd_en <= '0';
    end if;
  end process;

  srst <= RESET;
  FIFOOUT <= dout;

  datafifo_dcfeb_inst : datafifo_dcfeb_top
    PORT MAP (
      WR_CLK                    => wr_clk_i,
      RD_CLK                    => rd_clk_i,
      SRST                      => srst,
      PROG_FULL                 => prog_full,
      --SLEEP                     => sleep,
      wr_rst_busy               => wr_rst_busy,
      rd_rst_busy               => rd_rst_busy,
      WR_EN                     => wr_en,
      RD_EN                     => rd_en,
      DIN                       => din,
      DOUT                      => dout,
      FULL                      => full,
      EMPTY                     => empty);

end Behavioral;
