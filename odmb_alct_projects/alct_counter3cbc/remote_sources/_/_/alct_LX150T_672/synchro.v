// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : synchro.v
// Timestamp : Fri Mar 22 16:34:02 2019

module synchro
(
    hard_rst,
    os_enable,
    ccb_cmd,
    ccb_cmd_strobe,
    ccb_bc0,
    bxn_offset,
    lhc_cycle_sel,
    bxn_counter,
    l1a_cnt_reset,
    fmm_trig_stop,
    ttc_l1reset,
    ttc_bc0,
    ttc_start_trigger,
    ttc_stop_trigger,
    bxn_before_reset,
    clk
);

    input hard_rst;
    input os_enable;
    input [5:0] ccb_cmd;
    input ccb_cmd_strobe;
    input ccb_bc0;
    input [11:0] bxn_offset;
    input lhc_cycle_sel;
    output [11:0] bxn_counter;
    reg    [11:0] bxn_counter;
    output l1a_cnt_reset;
    reg    l1a_cnt_reset;
    output fmm_trig_stop;
    reg    fmm_trig_stop;
    output ttc_l1reset;
    output ttc_bc0;
    output ttc_start_trigger;
    output ttc_stop_trigger;
    output [11:0] bxn_before_reset;
    reg    [11:0] bxn_before_reset;
    input clk;

    wire [11:0] lhc_cycle;
    reg [1:0] fmm_sm;
    assign lhc_cycle = (lhc_cycle_sel) ? 3564 : 924;
    assign ttc_l1reset = (ccb_cmd == 3) && ccb_cmd_strobe;
    assign ttc_bc0 = (ccb_cmd == 1) && ccb_cmd_strobe;
    assign ttc_start_trigger = (ccb_cmd == 6) && ccb_cmd_strobe;
    assign ttc_stop_trigger = (ccb_cmd == 7) && ccb_cmd_strobe;
    always @(posedge clk) 
    begin
        fmm_trig_stop = 0;
        l1a_cnt_reset = 0;
        if (!hard_rst) 
        begin
            fmm_sm = 0;
            fmm_trig_stop = 1;
            l1a_cnt_reset = 1;
            bxn_counter = bxn_offset;
        end
        else 
        begin
            case (fmm_sm)
                0 : 
                begin
                    fmm_trig_stop = 1;
                    if (ttc_l1reset) fmm_sm = 1;
                    else if (ttc_start_trigger) fmm_sm = 2;
                end
                1 : 
                begin
                    fmm_trig_stop = 1;
                    l1a_cnt_reset = 1;
                    bxn_counter = bxn_offset;
                    fmm_sm = 2;
                end
                2 : 
                begin
                    fmm_trig_stop = 1;
                    if (ttc_bc0) fmm_sm = 3;
                    else if (ttc_l1reset) fmm_sm = 1;
                    else if (ttc_stop_trigger) fmm_sm = 0;
                end
                3 : 
                begin
                    if (ttc_stop_trigger) fmm_sm = 0;
                    else if (ttc_l1reset) fmm_sm = 1;
                end
                default : fmm_sm = 0;
            endcase
            if (ttc_bc0) 
            begin
                bxn_before_reset = bxn_counter;
                bxn_counter = bxn_offset;
            end
            else if (bxn_counter == (lhc_cycle - 1)) bxn_counter = 0;
            else bxn_counter = bxn_counter + 1;
            if (os_enable) fmm_trig_stop = 0;
        end
    end
endmodule
