# In the source directory run the below command
# vivado -nojournal -nolog -mode batch -source project_generator.tcl

# Environment variables
set FPGA_TYPE xcku040-ffva1156-2-e

# Generate ip
set argv $FPGA_TYPE
set argc 1
# create ip project when needed
#source ip_generator.tcl

# Create project
create_project miniodmb7 project -part $FPGA_TYPE -force
set_property target_language VHDL [current_project]
set_property target_simulator XSim [current_project]

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
# Import local files from the original project

# Add files
# for f in source/*; do echo \"$f\"\\; done
# find ip -type f -name "*.xci"
set files [list \
"source/miniodmb7_ucsb_top.vhd"\
"source/miniodmb7_ucsb_top.xdc"\
]

add_files -norecurse $files
add_files -fileset constrs_1 -norecurse "source/gtwizard_ultrascale_1_example_top.xdc"

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "miniodmb7_ucsb_top" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj

# Add tcl for simulation
## not set currently, add when needed
#set_property -name {xsim.simulate.custom_tcl} -value {../../../../source/Firmware_tb.tcl} -objects [get_filesets sim_1]

# Set ip as global
#set_property generate_synth_checkpoint false [get_files  ip/$FPGA_TYPE/clockManager/clockManager.xci]
#set_property generate_synth_checkpoint false [get_files  ip/$FPGA_TYPE/ila_0/ila_0.xci]
#set_property generate_synth_checkpoint false [get_files  ip/$FPGA_TYPE/gtwizard_ultrascale_1/gtwizard_ultrascale_1.xci]
#set_property generate_synth_checkpoint false [get_files  ip/$FPGA_TYPE/gtwizard_ultrascale_1_vio_0/gtwizard_ultrascale_1_vio_0.xci]

puts "\[Success\] Created project"
close_project
