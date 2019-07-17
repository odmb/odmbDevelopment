gui_open_window Wave
gui_sg_create dll_2019_group
gui_list_add_group -id Wave.1 {dll_2019_group}
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.test_phase}
gui_set_radix -radix {ascii} -signals {dll_2019_tb.test_phase}
gui_sg_addsignal -group dll_2019_group {{Input_clocks}} -divider
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.CLK_IN1}
gui_sg_addsignal -group dll_2019_group {{Output_clocks}} -divider
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.dut.clk}
gui_list_expand -id Wave.1 dll_2019_tb.dut.clk
gui_sg_addsignal -group dll_2019_group {{Status_control}} -divider
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.RESET}
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.LOCKED}
gui_sg_addsignal -group dll_2019_group {{Counters}} -divider
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.COUNT}
gui_sg_addsignal -group dll_2019_group {dll_2019_tb.dut.counter}
gui_list_expand -id Wave.1 dll_2019_tb.dut.counter
gui_zoom -window Wave.1 -full
