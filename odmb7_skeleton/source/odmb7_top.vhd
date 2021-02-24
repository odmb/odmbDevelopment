library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library unisim;
use unisim.vcomponents.all;

entity odmb7_top is
  generic (
    NCFEB       : integer range 1 to 7 := 7  -- Number of DCFEBS, 7 for ME1/1, 5
  );
  port (
    --------------------
    -- Clock
    --------------------
    CMS_CLK_FPGA_P : in std_logic;      -- system clock: 40.07897 MHz
    CMS_CLK_FPGA_N : in std_logic;      -- system clock: 40.07897 MHz
    GP_CLK_6_P : in std_logic;          -- clock synthesizer ODIV6: 80 MHz
    GP_CLK_6_N : in std_logic;          -- clock synthesizer ODIV6: 80 MHz
    GP_CLK_7_P : in std_logic;          -- clock synthesizer ODIV7: 80 MHz
    GP_CLK_7_N : in std_logic;          -- clock synthesizer ODIV7: 80 MHz
    REF_CLK_1_P : in std_logic;         -- refclk0 to 224
    REF_CLK_1_N : in std_logic;         -- refclk0 to 224
    REF_CLK_2_P : in std_logic;         -- refclk0 to 227
    REF_CLK_2_N : in std_logic;         -- refclk0 to 227
    REF_CLK_3_P : in std_logic;         -- refclk0 to 226
    REF_CLK_3_N : in std_logic;         -- refclk0 to 226
    REF_CLK_4_P : in std_logic;         -- refclk0 to 225
    REF_CLK_4_N : in std_logic;         -- refclk0 to 225
    REF_CLK_5_P : in std_logic;         -- refclk1 to 227
    REF_CLK_5_N : in std_logic;         -- refclk1 to 227
    CLK_125_REF_P : in std_logic;       -- refclk1 to 226
    CLK_125_REF_N : in std_logic;       -- refclk1 to 226
    EMCCLK : in std_logic;              -- Low frequency, 133 MHz for SPI programing clock
    LF_CLK : in std_logic;              -- Low frequency, 10 kHz

    --------------------
    -- Signals controlled by ODMB_VME
    --------------------
    VME_DATA        : inout std_logic_vector(15 downto 0); -- Bank 48
    VME_GAP_B       : in std_logic;                        -- Bank 48
    VME_GA_B        : in std_logic_vector(4 downto 0);     -- Bank 48
    VME_ADDR        : in std_logic_vector(23 downto 1);    -- Bank 46
    VME_AM          : in std_logic_vector(5 downto 0);     -- Bank 46
    VME_AS_B        : in std_logic;                        -- Bank 46
    VME_DS_B        : in std_logic_vector(1 downto 0);     -- Bank 46
    VME_LWORD_B     : in std_logic;                        -- Bank 48
    VME_WRITE_B     : in std_logic;                        -- Bank 48
    VME_IACK_B      : in std_logic;                        -- Bank 48
    VME_BERR_B      : in std_logic;                        -- Bank 48
    VME_SYSRST_B    : in std_logic;                        -- Bank 48, not used
    VME_SYSFAIL_B   : in std_logic;                        -- Bank 48
    VME_CLK_B       : in std_logic;                        -- Bank 48, not used
    KUS_VME_OE_B    : out std_logic;                       -- Bank 44
    KUS_VME_DIR     : out std_logic;                       -- Bank 44
    VME_DTACK_KUS_B : out std_logic;                       -- Bank 44

    DCFEB_TCK_P    : out std_logic_vector(NCFEB downto 1); -- Bank 68
    DCFEB_TCK_N    : out std_logic_vector(NCFEB downto 1); -- Bank 68
    DCFEB_TMS_P    : out std_logic;                        -- Bank 68
    DCFEB_TMS_N    : out std_logic;                        -- Bank 68
    DCFEB_TDI_P    : out std_logic;                        -- Bank 68
    DCFEB_TDI_N    : out std_logic;                        -- Bank 68
    DCFEB_TDO_P    : in  std_logic_vector(NCFEB downto 1); -- "C_TDO" in Bank 67-68
    DCFEB_TDO_N    : in  std_logic_vector(NCFEB downto 1); -- "C_TDO" in Bank 67-68
    DCFEB_DONE     : in  std_logic_vector(NCFEB downto 1); -- "DONE_?" in Bank 68
    RESYNC_P       : out std_logic;                        -- Bank 66
    RESYNC_N       : out std_logic;                        -- Bank 66
    BC0_P          : out std_logic;                        -- Bank 68
    BC0_N          : out std_logic;                        -- Bank 68
    INJPLS_P       : out std_logic;                        -- Bank 66, ODMB CTRL
    INJPLS_N       : out std_logic;                        -- Bank 66, ODMB CTRL
    EXTPLS_P       : out std_logic;                        -- Bank 66, ODMB CTRL
    EXTPLS_N       : out std_logic;                        -- Bank 66, ODMB CTRL
    L1A_P          : out std_logic;                        -- Bank 66, ODMB CTRL
    L1A_N          : out std_logic;                        -- Bank 66, ODMB CTRL
    L1A_MATCH_P    : out std_logic_vector(NCFEB downto 1); -- Bank 66, ODMB CTRL
    L1A_MATCH_N    : out std_logic_vector(NCFEB downto 1); -- Bank 66, ODMB CTRL
    PPIB_OUT_EN_B  : out std_logic;                        -- Bank 68

    --------------------------------
    -- LVMB control/monitor signals
    --------------------------------
    LVMB_PON     : out std_logic_vector(7 downto 0);
    PON_LOAD     : out std_logic;
    PON_OE_B     : out std_logic;
    MON_LVMB_PON : in  std_logic_vector(7 downto 0);
    LVMB_CSB     : out std_logic_vector(6 downto 0);
    LVMB_SCLK    : out std_logic;
    LVMB_SDIN    : out std_logic;
    LVMB_SDOUT_P : in  std_logic;                         -- C_LVMB_SDOUT_P in Bank 67
    LVMB_SDOUT_N : in  std_logic;                         -- C_LVMB_SDOUT_N in Bank 67

    --------------------------------
    -- OTMB communication signals
    --------------------------------
    OTMB        : in  std_logic_vector(35 downto 0);      -- "TMB[35:0]" in Bank 44-45
    RAWLCT      : in  std_logic_vector(NCFEB-1 downto 0); -- Bank 45
    OTMB_DAV    : in  std_logic;                          -- "TMB_DAV" in Bank 45
    OTMB_FF_CLK : in  std_logic;                          -- "TMB_FF_CLK" in Bank 45, not used
    RSVTD_IN    : in  std_logic_vector(7 downto 3);       -- "RSVTD[7:3]" in Bank 44-45
    RSVTD_OUT   : out std_logic_vector(2 downto 0);       -- "RSVTD[2:0]" in Bank 44-45
    LCT_RQST    : out std_logic_vector(2 downto 1);       -- Bank 45

    --------------------------------
    -- ODMB optical ports
    --------------------------------
    -- Acutally connected optical TX/RX signals
    DAQ_RX_P     : in std_logic_vector(10 downto 0);
    DAQ_RX_N     : in std_logic_vector(10 downto 0);
    DAQ_SPY_RX_P : in std_logic;        -- DAQ_RX_P11 or SPY_RX_P
    DAQ_SPY_RX_N : in std_logic;        -- DAQ_RX_N11 or SPY_RX_N
    B04_RX_P     : in std_logic_vector(4 downto 2); -- B04 RX, no use yet
    B04_RX_N     : in std_logic_vector(4 downto 2); -- B04 RX, no use yet
    BCK_PRS_P    : in std_logic; -- B04_RX1_P
    BCK_PRS_N    : in std_logic; -- B04_RX1_N

    SPY_TX_P     : out std_logic;        -- output to PC
    SPY_TX_N     : out std_logic;        -- output to PC
    DAQ_TX_P     : out std_logic_vector(4 downto 1); -- B04 TX, output to FED
    DAQ_TX_N     : out std_logic_vector(4 downto 1); -- B04 TX, output to FED

    --------------------------------
    -- Optical control signals
    --------------------------------
    DAQ_SPY_SEL    : out std_logic;      -- 0 for DAQ_RX_P/N11, 1 for SPY_RX_P/N

    RX12_I2C_ENA   : out std_logic;
    RX12_SDA       : inout std_logic;
    RX12_SCL       : inout std_logic;
    RX12_CS_B      : out std_logic;
    RX12_RST_B    : out std_logic;
    RX12_INT_B     : in std_logic;
    RX12_PRESENT_B : in std_logic;

    TX12_I2C_ENA   : out std_logic;
    TX12_SDA       : inout std_logic;
    TX12_SCL       : inout std_logic;
    TX12_CS_B      : out std_logic;
    TX12_RST_B     : out std_logic;
    TX12_INT_B     : in std_logic;
    TX12_PRESENT_B : in std_logic;

    B04_I2C_ENA   : out std_logic;
    B04_SDA       : inout std_logic;
    B04_SCL       : inout std_logic;
    B04_CS_B      : out std_logic;
    B04_RST_B     : out std_logic;
    B04_INT_B     : in std_logic;
    B04_PRESENT_B : in std_logic;

    SPY_I2C_ENA   : out std_logic;
    SPY_SDA       : inout std_logic;
    SPY_SCL       : inout std_logic;
    SPY_SD        : in std_logic;   -- Signal Detect
    SPY_TDIS      : out std_logic;  -- Transmitter Disable

    --------------------------------
    -- Essential selector/reset signals not classified yet
    --------------------------------
    KUS_DL_SEL    : out std_logic;  -- Bank 47, ODMB JTAG path select
    FPGA_SEL      : out std_logic;  -- Bank 47, clock synthesizaer control input select
    RST_CLKS_B    : out std_logic;  -- Bank 47, clock synthesizaer reset
    CCB_HARDRST_B : in std_logic;   -- Bank 45
    CCB_SOFT_RST  : in std_logic;   -- Bank 45
    ODMB_DONE     : in std_logic;   -- "DONE" in bank 66, monitor of the DONE from Bank 0

    --------------------------------
    -- Clock synthesizer I2C
    --------------------------------

    --------------------------------
    -- SYSMON ports
    --------------------------------
    SYSMON_P      : in std_logic_vector(15 downto 0);
    SYSMON_N      : in std_logic_vector(15 downto 0);
    ADC_CS_B      : out std_logic_vector(4 downto 0);
    ADC_SCK       : out std_logic;
    ADC_DIN       : out std_logic;
    ADC_DOUT      : in std_logic;

    --------------------------------
    -- Others
    --------------------------------
    LEDS_CFV      : out std_logic_vector(11 downto 0)

    );
end odmb7_top;

architecture odmb_inst of odmb7_top is

  component odmb7_clocking is
    port (
      -- Input ports
      CMS_CLK_FPGA_P : in std_logic;    -- system clock: 40.07897 MHz
      CMS_CLK_FPGA_N : in std_logic;    -- system clock: 40.07897 MHz
      GP_CLK_6_P     : in std_logic;    -- clock synthesizer ODIV6: 80 MHz
      GP_CLK_6_N     : in std_logic;    -- clock synthesizer ODIV6: 80 MHz
      GP_CLK_7_P     : in std_logic;    -- clock synthesizer ODIV7: 80 MHz
      GP_CLK_7_N     : in std_logic;    -- clock synthesizer ODIV7: 80 MHz
      REF_CLK_1_P    : in std_logic;    -- refclk0 to 224
      REF_CLK_1_N    : in std_logic;    -- refclk0 to 224
      REF_CLK_2_P    : in std_logic;    -- refclk0 to 227
      REF_CLK_2_N    : in std_logic;    -- refclk0 to 227
      REF_CLK_3_P    : in std_logic;    -- refclk0 to 226
      REF_CLK_3_N    : in std_logic;    -- refclk0 to 226
      REF_CLK_4_P    : in std_logic;    -- refclk0 to 225
      REF_CLK_4_N    : in std_logic;    -- refclk0 to 225
      REF_CLK_5_P    : in std_logic;    -- refclk1 to 227
      REF_CLK_5_N    : in std_logic;    -- refclk1 to 227
      CLK_125_REF_P  : in std_logic;    -- refclk1 to 226
      CLK_125_REF_N  : in std_logic;    -- refclk1 to 226
      EMCCLK         : in std_logic;    -- Low frequency, 133 MHz for SPI programing clock
      LF_CLK         : in std_logic;    -- Low frequency, 10 kHz

      -- Output clocks
      mgtrefclk0_224 : out std_logic;   -- MGT refclk for GT wizard
      mgtrefclk0_225 : out std_logic;   -- MGT refclk for GT wizard
      mgtrefclk0_226 : out std_logic;   -- MGT refclk for GT wizard
      mgtrefclk1_226 : out std_logic;   -- MGT refclk for GT wizard
      mgtrefclk0_227 : out std_logic;   -- MGT refclk for GT wizard
      mgtrefclk1_227 : out std_logic;   -- MGT refclk for GT wizard
      clk_sysclk625k : out std_logic;
      clk_sysclk2p5  : out std_logic;
      clk_sysclk10   : out std_logic;   -- derived clock from MMCM
      clk_sysclk20   : out std_logic;   -- derived clock from MMCM
      clk_sysclk40   : out std_logic;   -- derived clock from MMCM
      clk_sysclk80   : out std_logic;   -- derived clock from MMCM
      clk_cmsclk     : out std_logic;   -- buffed CMS clock, 40.07897 MHz
      clk_emcclk     : out std_logic;   -- buffed EMC clock
      clk_lfclk      : out std_logic;   -- buffed LF clock
      clk_gp6        : out std_logic;
      clk_gp7        : out std_logic;
      clk_mgtclk1    : out std_logic;   -- buffed ODIV2 port of the refclks
      clk_mgtclk2    : out std_logic;   -- buffed ODIV2 port of the refclks
      clk_mgtclk3    : out std_logic;   -- buffed ODIV2 port of the refclks
      clk_mgtclk4    : out std_logic;   -- buffed ODIV2 port of the refclks
      clk_mgtclk5    : out std_logic;   -- buffed ODIV2 port of the refclks
      clk_mgtclk125  : out std_logic    -- buffed ODIV2 port of the refclks
      );
  end component;

  --------------------------------------
  -- Clock signals
  --------------------------------------
  signal mgtrefclk0_224 : std_logic;
  signal mgtrefclk0_225 : std_logic;
  signal mgtrefclk0_226 : std_logic;
  signal mgtrefclk1_226 : std_logic;
  signal mgtrefclk0_227 : std_logic;
  signal mgtrefclk1_227 : std_logic;
  signal gth_sysclk_i : std_logic;
  signal clk_sysclk625k : std_logic;
  signal clk_sysclk2p5 : std_logic;
  signal clk_sysclk10 : std_logic;
  signal clk_sysclk20 : std_logic;
  signal clk_sysclk40 : std_logic;
  signal clk_sysclk80 : std_logic;
  signal clk_cmsclk : std_logic;
  signal clk_emcclk : std_logic;
  signal clk_lfclk : std_logic;
  signal clk_gp6 : std_logic;
  signal clk_gp7 : std_logic;
  signal clk_mgtclk1 : std_logic;
  signal clk_mgtclk2 : std_logic;
  signal clk_mgtclk3 : std_logic;
  signal clk_mgtclk4 : std_logic;
  signal clk_mgtclk5 : std_logic;
  signal clk_mgtclk125 : std_logic;

  --------------------------------------
  -- PPIB/DCFEB signals
  --------------------------------------
  signal dcfeb_tck    : std_logic_vector (NCFEB downto 1) := (others => '0');
  signal dcfeb_tms    : std_logic := '0';
  signal dcfeb_tdi    : std_logic := '0';
  signal dcfeb_tdo    : std_logic_vector (NCFEB downto 1) := (others => '0');

  signal reset_pulse, reset_pulse_q : std_logic := '0';
  signal l1acnt_rst, l1a_reset_pulse, l1a_reset_pulse_q : std_logic := '0';
  signal l1acnt_rst_meta, l1acnt_rst_sync : std_logic := '0';
  signal premask_injpls, premask_extpls, dcfeb_injpls, dcfeb_extpls : std_logic := '0';
  signal test_bc0, pre_bc0, dcfeb_bc0, dcfeb_resync : std_logic := '0';
  signal dcfeb_l1a, masked_l1a, odmbctrl_l1a : std_logic := '0';
  signal dcfeb_l1a_match, masked_l1a_match, odmbctrl_l1a_match : std_logic_vector(NCFEB downto 1) := (others => '0');

  -- signals to generate dcfeb_initjtag when DCFEBs are done programming
  signal pon_rst_reg : std_logic_vector(31 downto 0) := x"00FFFFFF";
  signal pon_reset : std_logic := '0';
  signal done_cnt_en, done_cnt_rst                           : std_logic_vector(NCFEB downto 1);
  type done_cnt_type is array (NCFEB downto 1) of integer range 0 to 3;
  signal done_cnt                                            : done_cnt_type;
  type done_state_type is (DONE_IDLE, DONE_LOW, DONE_COUNTING);
  type done_state_array_type is array (NCFEB downto 1) of done_state_type;
  signal done_next_state, done_current_state                 : done_state_array_type;
  signal dcfeb_done_pulse : std_logic_vector(NCFEB downto 1) := (others => '0');
  signal dcfeb_initjtag : std_logic := '0';
  signal dcfeb_initjtag_d : std_logic := '0';
  signal dcfeb_initjtag_dd : std_logic := '0';
  
begin

  -------------------------------------------------------------------------------------------
  -- Constant driver for selector/reset pins for board to work
  -------------------------------------------------------------------------------------------
  KUS_DL_SEL <= '1';
  FPGA_SEL <= '0';
  RST_CLKS_B <= '1';
  PPIB_OUT_EN_B <= '0';

  -------------------------------------------------------------------------------------------
  -- Constant driver for firefly selector/reset pins
  -------------------------------------------------------------------------------------------
  RX12_I2C_ENA <= '0';
  RX12_CS_B <= '1';
  RX12_RST_B <= '1';
  TX12_I2C_ENA <= '0';
  TX12_CS_B <= '1';
  TX12_RST_B <= '1';
  B04_I2C_ENA <= '0';
  B04_CS_B <= '1';
  B04_RST_B <= '1';
  SPY_TDIS <= '0';

  -------------------------------------------------------------------------------------------
  -- Handle ODMB7 clocks
  -------------------------------------------------------------------------------------------
  u_clocking : odmb7_clocking
    port map (
      CMS_CLK_FPGA_P => CMS_CLK_FPGA_P,
      CMS_CLK_FPGA_N => CMS_CLK_FPGA_N,
      GP_CLK_6_P     => GP_CLK_6_P,
      GP_CLK_6_N     => GP_CLK_6_N,
      GP_CLK_7_P     => GP_CLK_7_P,
      GP_CLK_7_N     => GP_CLK_7_N,
      REF_CLK_1_P    => REF_CLK_1_P,
      REF_CLK_1_N    => REF_CLK_1_N,
      REF_CLK_2_P    => REF_CLK_2_P,
      REF_CLK_2_N    => REF_CLK_2_N,
      REF_CLK_3_P    => REF_CLK_3_P,
      REF_CLK_3_N    => REF_CLK_3_N,
      REF_CLK_4_P    => REF_CLK_4_P,
      REF_CLK_4_N    => REF_CLK_4_N,
      REF_CLK_5_P    => REF_CLK_5_P,
      REF_CLK_5_N    => REF_CLK_5_N,
      CLK_125_REF_P  => CLK_125_REF_P,
      CLK_125_REF_N  => CLK_125_REF_N,
      EMCCLK         => EMCCLK,
      LF_CLK         => LF_CLK,
      mgtrefclk0_224 => mgtrefclk0_224,
      mgtrefclk0_225 => mgtrefclk0_225,
      mgtrefclk0_226 => mgtrefclk0_226,
      mgtrefclk1_226 => mgtrefclk1_226,
      mgtrefclk0_227 => mgtrefclk0_227,
      mgtrefclk1_227 => mgtrefclk1_227,
      clk_sysclk625k => clk_sysclk625k,
      clk_sysclk2p5  => clk_sysclk2p5,
      clk_sysclk10   => clk_sysclk10,
      clk_sysclk20   => clk_sysclk20,
      clk_sysclk40   => clk_sysclk40,
      clk_sysclk80   => clk_sysclk80,
      clk_cmsclk     => clk_cmsclk,
      clk_emcclk     => clk_emcclk,
      clk_lfclk      => clk_lfclk,
      clk_gp6        => clk_gp6,
      clk_gp7        => clk_gp7,
      clk_mgtclk1    => clk_mgtclk1,
      clk_mgtclk2    => clk_mgtclk2,
      clk_mgtclk3    => clk_mgtclk3,
      clk_mgtclk4    => clk_mgtclk4,
      clk_mgtclk5    => clk_mgtclk5,
      clk_mgtclk125  => clk_mgtclk125
      );


  -------------------------------------------------------------------------------------------
  -- Handle PPIB/DCFEB signals
  -------------------------------------------------------------------------------------------
  -- Handle DCFEB I/O buffers
  OB_DCFEB_TMS: OBUFDS port map (I => dcfeb_tms, O => DCFEB_TMS_P, OB => DCFEB_TMS_N);
  OB_DCFEB_TDI: OBUFDS port map (I => dcfeb_tdi, O => DCFEB_TDI_P, OB => DCFEB_TDI_N);
  OB_DCFEB_INJPLS: OBUFDS port map (I => dcfeb_injpls, O => INJPLS_P, OB => INJPLS_N);
  OB_DCFEB_EXTPLS: OBUFDS port map (I => dcfeb_extpls, O => EXTPLS_P, OB => EXTPLS_N);
  OB_DCFEB_RESYNC: OBUFDS port map (I => dcfeb_resync, O => RESYNC_P, OB => RESYNC_N);
  OB_DCFEB_BC0: OBUFDS port map (I => dcfeb_bc0, O => BC0_P, OB => BC0_N);
  OB_DCFEB_L1A: OBUFDS port map (I => dcfeb_l1a, O => L1A_P, OB => L1A_N);
  GEN_DCFEBJTAG_BUFDS : for I in 1 to NCFEB generate
  begin
    OB_DCFEB_TCK: OBUFDS port map (I => dcfeb_tck(I), O => DCFEB_TCK_P(I), OB => DCFEB_TCK_N(I));
    IB_DCFEB_TDO: IBUFDS port map (O => dcfeb_tdo(I), I => DCFEB_TDO_P(I), IB => DCFEB_TDO_N(I));
    OB_DCFEB_L1A_MATCH: OBUFDS port map (I => dcfeb_l1a_match(I), O => L1A_MATCH_P(I), OB => L1A_MATCH_N(I));
  end generate GEN_DCFEBJTAG_BUFDS;

  -------------------------------------------------------------------------------------------
  -- SYSMON module instantiation
  -------------------------------------------------------------------------------------------
  sysmone1_inst : SYSMONE1
    port map (
      ALM => open,
      OT => open,
      DO => open,
      DRDY => open,
      BUSY => open,
      CHANNEL => open,
      EOC => open,
      EOS => open,
      JTAGBUSY => open,
      JTAGLOCKED => open,
      JTAGMODIFIED => open,
      MUXADDR => open,
      VAUXN => SYSMON_N, -- 16 bits AD[0-15]N
      VAUXP => SYSMON_P, -- 16 bits AD[0-15]P
      CONVST => '0',
      CONVSTCLK => '0',
      RESET => '0',
      VN => '0',
      VP => '0',
      DADDR => X"00",
      DCLK => '0',
      DEN => '0',
      DI => X"0000",
      DWE => '0',
      I2C_SCLK => '0',
      I2C_SDA => '0'
      );

end odmb_inst;
