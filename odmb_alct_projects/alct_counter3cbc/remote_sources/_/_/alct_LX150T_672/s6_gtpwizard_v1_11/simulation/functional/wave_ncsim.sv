
###############################################################################
## wave_ncsim.sv
###############################################################################

  window new WaveWindow  -name  "Waves for Spartan-6 GTP Wizard Example Design"
  waveform  using  "Waves for Spartan-6 GTP Wizard Example Design"
  
  waveform  add  -label FRAME_CHECK_MODULE -comment tile0_frame_check0
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.begin_r
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.track_data_r
  waveform  add  -siganls  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.data_error_detected_r
  wavefrom  add  -siganls  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.start_of_packet_detected_r
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.RX_DATA
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check0.ERROR_COUNT
  waveform  add  -label FRAME_CHECK_MODULE -comment tile0_frame_check1
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.begin_r
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.track_data_r
  waveform  add  -siganls  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.data_error_detected_r
  wavefrom  add  -siganls  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.start_of_packet_detected_r
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.RX_DATA
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i+delimiter+tile0_frame_check1.ERROR_COUNT

  waveform  add  -label TILE0_s6_gtpwizard_v1_11 -comment TILE0_s6_gtpwizard_v1_11
  waveform  add  -label Loopback_and_Powerdown_Ports  -comment  Loopback_and_Powerdown_Ports
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.LOOPBACK0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.LOOPBACK1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXPOWERDOWN0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXPOWERDOWN1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXPOWERDOWN0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXPOWERDOWN1_IN
  waveform  add  -label PLL_Ports  -comment  PLL_Ports
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLK00_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLK01_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLK10_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLK11_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLKINEAST0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLKINEAST1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLKINWEST0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.CLKINWEST1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.GTPRESET0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.GTPRESET1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.PLLLKDET0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.PLLLKDET1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.REFSELDYPLL0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.REFSELDYPLL1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RESETDONE0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RESETDONE1_OUT
  waveform  add  -label Receive_Ports_-_8b10b_Decoder  -comment  Receive_Ports_-_8b10b_Decoder
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHARISCOMMA0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHARISCOMMA1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHARISK0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHARISK1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXDISPERR0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXDISPERR1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXNOTINTABLE0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXNOTINTABLE1_OUT
  waveform  add  -label Receive_Ports_-_Channel_Bonding  -comment  Receive_Ports_-_Channel_Bonding
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANBONDSEQ0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANBONDSEQ1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANISALIGNED0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANISALIGNED1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANREALIGN0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHANREALIGN1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHBONDMASTER0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHBONDMASTER1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHBONDSLAVE0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXCHBONDSLAVE1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENCHANSYNC0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENCHANSYNC1_IN
  waveform  add  -label Receive_Ports_-_Comma_Detection_and_Alignment  -comment  Receive_Ports_-_Comma_Detection_and_Alignment
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENMCOMMAALIGN0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENMCOMMAALIGN1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENPCOMMAALIGN0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXENPCOMMAALIGN1_IN
  waveform  add  -label Receive_Ports_-_RX_Data_Path_interface  -comment  Receive_Ports_-_RX_Data_Path_interface
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXDATA0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXDATA1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXUSRCLK0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXUSRCLK1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXUSRCLK20_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXUSRCLK21_IN
  waveform  add  -label Receive_Ports_-_RX_Driver,OOB_signalling,Coupling_and_Eq.,CDR  -comment  Receive_Ports_-_RX_Driver,OOB_signalling,Coupling_and_Eq.,CDR
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXEQMIX0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXEQMIX1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXN0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXN1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXP0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.RXP1_IN
  waveform  add  -label TX/RX_Datapath_Ports  -comment  TX/RX_Datapath_Ports
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.GTPCLKOUT0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.GTPCLKOUT1_OUT
  waveform  add  -label Transmit_Ports_-_8b10b_Encoder_Control  -comment  Transmit_Ports_-_8b10b_Encoder_Control
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXCHARISK0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXCHARISK1_IN
  waveform  add  -label Transmit_Ports_-_TX_Data_Path_interface  -comment  Transmit_Ports_-_TX_Data_Path_interface
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXDATA0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXDATA1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXOUTCLK0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXOUTCLK1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXUSRCLK0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXUSRCLK1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXUSRCLK20_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXUSRCLK21_IN
  waveform  add  -label Transmit_Ports_-_TX_Driver_and_OOB_signalling  -comment  Transmit_Ports_-_TX_Driver_and_OOB_signalling
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXDIFFCTRL0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXDIFFCTRL1_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXN0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXN1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXP0_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXP1_OUT
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXPREEMPHASIS0_IN
  waveform  add  -signals  DEMO_TB.s6_gtpwizard_v1_11_top_i.s6_gtpwizard_v1_11_i.tile0_s6_gtpwizard_v1_11_i.TXPREEMPHASIS1_IN

  console submit -using simulator -wait no "run 50 us"

