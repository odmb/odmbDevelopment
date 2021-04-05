-- Package with types used by UCSB
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

package ucsb_types is
  
  constant NCFEB : integer range 1 to 7 := 7;  -- Number of DCFEBS, 7 for ME1/1, 5
  constant NDEVICE : integer range 1 to 10 := 9; -- Number VME devices
  constant NREGS : integer := 16;       -- Number of registers
  constant NCONST : integer := 16;      -- Number of Protected registers

  -- Flag for synthesis/simulation
  constant in_simulation : BOOLEAN := false
                                      -- synthesis translate_off
                                      or true
                                      -- synthesis translate_on
                                      ;
  constant in_synthesis : BOOLEAN := not in_simulation;

end ucsb_types;

