# ODMB7 Skeleton Top and Pin Assignments

This folder is only used to shared the common top file and pin assignments for future ODMB7 firmware development.
The idea for doing this is:
  1. to reduce the duplication of work in finding the port locations
  2. document the known port specifications (e.g. termination condition, clock constraints)
  3. document the known selector/enable/reset values that need to be set for ODMB7 to work
  4. provide a possible common top structure to start a individual module test (e.g. common naming for the ports)

This folder is not intended to hold a Vivado project that is working combination of the functional ported modules,
for that purpose, use the [odmb7_port_testing](https://github.com/odmb/odmb7_port_testing) repo.

Please review the configuration of the ports you have looked at, and add ports/common modules that are not already in the list.
Please also add additional rules to the port naming, and you are very encouraged to comply with the ones already 

Note: following modifications may be need if not using some of the following ports
- Remove `SPY_TX_P/N`, `DAQ_TX_P/N` to prevent Vivado from giving error

## Structure
- Top file: `source/odmb7_top.vhd`
- Pinout only: `constraints/odmb7_pintout.vhd`
  - Include the port location and I/O standard, termination situation
- Clock group: `constraints/odmb7_config.vhd`
  - Setup clock frequency constraints
- Other configs: `constraints/odmb7_config.vhd`
  - e.g. Bit-file compression
- Helper script: `scripts/sysmon_setup.tcl`
  - Necessary register setup for using SYSMON module from Vivado

- [new] Clocking module: `source/odmb7_clocking.vhd`
  - A idea to wrap all the buffers into this file, and interface between the ports and the clocks to be used for different modules,
    this may not work for all clocks, but we can pack as much as possible into this file

## Porting naming guidelines
- The naming of the signals in the top module should follow the signal names connected to the FPGA in the schematic as much as possible, 
  except when they can be improved to give more clarity, in such case, the real signal name shall be attached in the comment. e.g.
  - `C_TDO` --> `DCFEB_TDO` 
  - `DONE_?` --> `DCFEB_DONE` (ambiguous signal in Bank 67-68)
  - `DONE` --> `ODMB_DONE` (ambiguous signal in Bank 66)
  - `FPGA_SEL_18` --> `FPGA_SEL` (drop voltage specification)

- For negation in signal name, `_B` should be attached in the signal name, except when the negation is used to indicate the 0 of a selector. e.g.
  - Selector: `DAQ_SPY_SEL` (0=DAQ, 1=SPY), `KUS_DL_SEL` (0=KUS, 1=DL)
  - Negated reset: `RX12_RST_B`

- Try to assign every connected signal a corresponding signal in the entity declaration, even if they are unused for now (just to keep the record).

## Progress
This is not a complete list and only listing already included ports

- [X] Clock ports
- [-] Selector/monitor ports unclassified yet
- [X] VME ports
- [X] DCFEB JTAG/control ports
- [X] LVMB control/monitor ports
- [X] Optical ports
  - [X] Optical transceiver ports
  - [X] Firefly/Finisar control ports
- [-] SYSMON ports
  - [X] Current measurements for SYSMON
  - [-] Voltage monitor ports
- [X] LED ports
