// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : daq_06.v
// Timestamp : Fri Mar 22 16:34:02 2019

module daq_06
(
    ly0,
    ly1,
    ly2,
    ly3,
    ly4,
    ly5,
    best1,
    best2,
    bxn,
    fifo_tbins,
    daqp,
    l1a_delay,
    fifo_pretrig,
    fifo_mode,
    L1A,
    hard_rst,
    l1a_internal,
    l1a_window,
    l1a_offset,
    L1AWindow,
    l1aTP,
    validhd,
    send_empty,
    config_report_i,
    bxn_before_reset,
    virtex_id,
    trig_reg,
    config_reg,
    hot_channel_mask,
    collision_mask,
    zero_suppress,
    trig_stop,
    seu_error,
    clk
);

    input [111:0] ly0;
    input [111:0] ly1;
    input [111:0] ly2;
    input [111:0] ly3;
    input [111:0] ly4;
    input [111:0] ly5;
    input [10:0] best1;
    input [10:0] best2;
    input [11:0] bxn;
    input [4:0] fifo_tbins;
    output [18:0] daqp;
    input [7:0] l1a_delay;
    input [4:0] fifo_pretrig;
    input [1:0] fifo_mode;
    input L1A;
    input hard_rst;
    input l1a_internal;
    input [3:0] l1a_window;
    input [3:0] l1a_offset;
    output L1AWindow;
    output l1aTP;
    output validhd;
    input send_empty;
    input config_report_i;
    input [11:0] bxn_before_reset;
    input [39:0] virtex_id;
    input [2:0] trig_reg;
    input [68:0] config_reg;
    input [671:0] hot_channel_mask;
    input [391:0] collision_mask;
    input zero_suppress;
    input trig_stop;
    input seu_error;
    input clk;

    wire [10:0] best1e;
    wire [10:0] best2e;
    wire [11:0] bxne;
    reg [10:0] best1d;
    reg [10:0] best2d;
    reg [11:0] bxnd;
    wire [10:0] best1m;
    wire [10:0] best2m;
    wire [11:0] bxnm;
    wire [111:0] lyd0;
    wire [111:0] lyd1;
    wire [111:0] lyd2;
    wire [111:0] lyd3;
    wire [111:0] lyd4;
    wire [111:0] lyd5;
    wire [111:0] lym0;
    wire [111:0] lym1;
    wire [111:0] lym2;
    wire [111:0] lym3;
    wire [111:0] lym4;
    wire [111:0] lym5;
    reg l1a_fifo_re;
    wire l1a_fifo_empty;
    wire l1a_fifo_full;
    wire l1a_proc;
    wire best_we;
    wire raw_we;
    reg [7:0] best_adw;
    wire [7:0] best_adwf;
    reg [7:0] best_adr;
    reg [7:0] best_adb;
    reg [7:0] raw_adw;
    wire [7:0] raw_adwf;
    reg [7:0] raw_adr;
    reg [7:0] raw_adb;
    wire best_full;
    wire raw_full;
    wire best_fullf;
    wire raw_fullf;
    wire [11:0] l1a_in_count;
    wire [11:0] l1a_in_countf;
    reg [11:0] readout_count;
    reg [4:0] state;
    wire [7:0] l1a_int_delay;
    wire [3:0] l1a_int_offset;
    reg [3:0] best_cnt;
    reg have_lcts;
    reg [11:0] bxn_track;
    reg [3:0] lct_bins;
    reg [3:0] lct_bins_report;
    reg [4:0] raw_bins;
    reg [5:0] cmpart_cnt;
    reg [10:0] best1t;
    reg [10:0] best2t;
    reg best_first;
    reg [111:0] lyt [5:0];
    reg [5:0] raw_cnt;
    reg [2:0] ly_cnt;
    reg [3:0] wg_cnt;
    reg [2:0] crccalc;
    reg [18:0] daqw;
    wire davv;
    reg [10:0] frame_count;
    reg l1a_procr;
    reg [14:0] config_word [7:0];
    reg [3:0] conf_w_count;
    reg [13:0] collmask_word [27:0];
    reg [12:0] hot_word [59:0];
    reg [5:0] hot_w_count;
    wire [11:0] bxn_l1a;
    wire l1a_bxn_fifo_empty;
    wire l1a_bxn_fifo_full;
    reg [11:0] bxnr;
    reg ly_zero;
    reg tb_zero;
    wire valor;
    reg valorr;
    reg config_report;
    assign l1a_int_delay = l1a_delay - 1;
    assign l1a_int_offset = l1a_offset - 1;
    assign L1AWindow = best_we;
    assign l1aTP = l1a_proc;
    assign validhd = best1d[3];
    best_delay best_delay
    (
        {best1, best2, bxn},
        {best1e, best2e, bxne},
        l1a_int_delay,
        hard_rst,
        l1a_procr,
        l1a_window,
        best1[3],
        valor,
        trig_stop,
        clk
    );
    raw_delay raw_delay
    (
        {ly0, ly1, ly2, ly3, ly4, ly5},
        {lyd0, lyd1, lyd2, lyd3, lyd4, lyd5},
        l1a_delay + fifo_pretrig,
        hard_rst,
        trig_stop,
        clk
    );
    l1a_fifo l1a_fifo
    (
        {l1a_in_count, best_full, raw_full, best_adw, raw_adw},
        {l1a_in_countf, best_fullf, raw_fullf, best_adwf, raw_adwf},
        l1a_procr,
        l1a_fifo_re,
        !hard_rst,
        l1a_fifo_empty,
        l1a_fifo_full,
        clk
    );
    l1a_bxn_fifo l1a_bxn_fifo
    (
        bxnr,
        bxn_l1a,
        l1a_procr,
        l1a_fifo_re,
        !hard_rst,
        l1a_bxn_fifo_empty,
        l1a_bxn_fifo_full,
        clk
    );
    l1a_maker_ l1a_maker_
    (
        L1A,
        valor,
        best1e[3],
        l1a_proc,
        l1a_window,
        fifo_tbins,
        l1a_fifo_full,
        best_full,
        raw_full,
        fifo_mode != 0,
        best_we,
        raw_we,
        l1a_internal,
        l1a_in_count,
        l1a_offset,
        send_empty,
        hard_rst,
        clk
    );
    best_memory best_memory
    (
        best_adw,
        best_adr,
        best_adb,
        {best1d, best2d, bxnd},
        {best1m, best2m, bxnm},
        best_we,
        {4'b0, l1a_window},
        best_full,
        clk
    );
    raw_memory raw_memory
    (
        raw_adw,
        raw_adr,
        raw_adb,
        {lyd0, lyd1, lyd2, lyd3, lyd4, lyd5},
        {lym0, lym1, lym2, lym3, lym4, lym5},
        raw_we,
        {3'b0, fifo_tbins},
        raw_full,
        clk
    );
    crcgen crcgen
    (
        daqw,
        daqp,
        crccalc,
        davv,
        clk
    );
    davgen davgen
    (
        l1a_proc,
        davv,
        clk
    );
    always @(posedge clk) 
    begin
        if (!hard_rst) 
        begin
            readout_count = l1a_offset;
            state = 0;
            best_adw = 1;
            raw_adw = 1;
            best_adb = 0;
            raw_adb = 0;
            crccalc = 0;
            config_report = 0;
            ly_zero = 0;
        end
        else 
        begin
            if (best_we) best_adw = best_adw + 1;
            if (raw_we) raw_adw = raw_adw + 1;
            daqw = 19'b100_0000_0000_0000_0000;
            l1a_fifo_re = 0;
            case (state)
                0 : 
                begin
                    state = (l1a_fifo_empty) ? 0 : 1;
                    l1a_fifo_re = !l1a_fifo_empty;
                    crccalc = 0;
                end
                1 : 
                begin
                    state = 2;
                end
                2 : 
                begin
                    raw_adr = raw_adwf;
                    raw_adb = raw_adwf;
                    best_cnt = 0;
                    state = 3;
                end
                3 : 
                begin
                    state = 4;
                end
                4 : 
                begin
                    have_lcts = 1;
                    best_cnt = best_cnt + 1;
                    state = 5;
                    best_adr = best_adwf;
                    best_adb = best_adwf;
                    frame_count = 0;
                end
                5 : 
                begin
                    daqw = 19'hdb0a;
                    state = 6;
                    crccalc = 1;
                end
                6 : 
                begin
                    daqw = {7'hd, bxn_l1a};
                    state = 7;
                end
                7 : 
                begin
                    daqw = {7'hd, l1a_in_countf};
                    bxn_track = bxnm;
                    state = 8;
                end
                8 : 
                begin
                    daqw = {7'hd, readout_count};
                    state = 9;
                end
                9 : 
                begin
                    daqw = {4'b0, config_report, 1'b0, 1'b0, bxn_track};
                    state = 10;
                end
                10 : 
                begin
                    daqw = {6'h0, zero_suppress, bxn_before_reset};
                    state = 11;
                end
                11 : 
                begin
                    daqw = {7'h0, seu_error, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 3'h6};
                    state = 12;
                end
                12 : 
                begin
                    lct_bins = (send_empty || have_lcts) ? l1a_window : 0;
                    raw_bins = (fifo_mode != 0) ? fifo_tbins : 0;
                    lct_bins_report = (lct_bins != 0) ? lct_bins + 4'b1 : 4'b0;
                    daqw = {4'b0, 6'h5, lct_bins_report, raw_bins};
                    state = (config_report) ? 13 : (lct_bins != 0) ? 16 : (raw_bins != 0) ? 19 : 21;
                    conf_w_count = 0;
                    if (state == 16) 
                    begin
                        best1t = best1m;
                        best2t = best2m;
                        best_adr = best_adr + 1;
                        best_cnt = 0;
                        best_first = 1;
                    end
                    if (state == 19) 
                    begin
                        lyt[0] = lym0;
                        lyt[1] = lym1;
                        lyt[2] = lym2;
                        lyt[3] = lym3;
                        lyt[4] = lym4;
                        lyt[5] = lym5;
                        raw_adr = raw_adr + 1;
                        raw_cnt = 0;
                        ly_cnt = 0;
                        wg_cnt = 0;
                    end
                end
                13 : 
                begin
                    daqw = config_word[conf_w_count];
                    conf_w_count = conf_w_count + 1;
                    if (conf_w_count == 4'h8) 
                    begin
                        cmpart_cnt = 0;
                        state = 14;
                    end
                end
                14 : 
                begin
                    daqw = {4'h0, collmask_word[cmpart_cnt]};
                    cmpart_cnt = cmpart_cnt + 1;
                    if (cmpart_cnt == 28) 
                    begin
                        state = 15;
                        hot_w_count = 0;
                    end
                end
                15 : 
                begin
                    daqw = {7'b0, hot_word[hot_w_count]};
                    hot_w_count = hot_w_count + 1;
                    if (hot_w_count == 60) 
                    begin
                        state = (lct_bins != 0) ? 16 : (raw_bins != 0) ? 19 : 21;
                        best1t = best1m;
                        best2t = best2m;
                        best_adr = best_adr + 1;
                        best_cnt = 0;
                        best_first = 1;
                        if (state == 19) 
                        begin
                            lyt[0] = lym0;
                            lyt[1] = lym1;
                            lyt[2] = lym2;
                            lyt[3] = lym3;
                            lyt[4] = lym4;
                            lyt[5] = lym5;
                            raw_adr = raw_adr + 1;
                            raw_cnt = 0;
                            ly_cnt = 0;
                            wg_cnt = 0;
                        end
                    end
                end
                16 : 
                begin
                    if (best_first) daqw = {7'b0, best1t[10:4], 1'b0, best1t[2:0], best1t[3]};
                    else daqw = {7'b0, best2t[10:4], 1'b0, best2t[2:0], best2t[3]};
                    if (!best_first) 
                    begin
                        best_adr = best_adr + 1;
                        best1t = best1m;
                        best2t = best2m;
                        best_cnt = best_cnt + 1;
                    end
                    best_first = !best_first;
                    if (best_cnt == lct_bins) 
                    begin
                        state = 17;
                        lyt[0] = lym0;
                        lyt[1] = lym1;
                        lyt[2] = lym2;
                        lyt[3] = lym3;
                        lyt[4] = lym4;
                        lyt[5] = lym5;
                        raw_adr = raw_adr + 1;
                        raw_cnt = 0;
                        ly_cnt = 0;
                        wg_cnt = 0;
                    end
                end
                17 : 
                begin
                    daqw = 19'd0;
                    state = 18;
                end
                18 : 
                begin
                    daqw = 19'd0;
                    state = (raw_bins != 0) ? 19 : 21;
                end
                19 : 
                begin
                    ly_zero = zero_suppress && (lyt[ly_cnt] == 0);
                    if (!ly_zero) 
                    begin
                        if (wg_cnt == 0) daqw = {7'b0, lyt[ly_cnt][11:0]};
                        if (wg_cnt == 1) daqw = {7'b0, lyt[ly_cnt][23:12]};
                        if (wg_cnt == 2) daqw = {7'b0, lyt[ly_cnt][35:24]};
                        if (wg_cnt == 3) daqw = {7'b0, lyt[ly_cnt][47:36]};
                        if (wg_cnt == 4) daqw = {7'b0, lyt[ly_cnt][59:48]};
                        if (wg_cnt == 5) daqw = {7'b0, lyt[ly_cnt][71:60]};
                        if (wg_cnt == 6) daqw = {7'b0, lyt[ly_cnt][83:72]};
                        if (wg_cnt == 7) daqw = {7'b0, lyt[ly_cnt][95:84]};
                        if (wg_cnt == 8) daqw = {7'b0, lyt[ly_cnt][107:96]};
                    end
                    if ((wg_cnt == 9) || ly_zero) 
                    begin
                        if (!ly_zero) daqw = {7'b0, lyt[ly_cnt][111:108]};
                        else daqw = 19'h1000;
                        wg_cnt = 0;
                        ly_cnt = ly_cnt + 1;
                        if ((ly_cnt == 6) || tb_zero) 
                        begin
                            if (tb_zero) daqw = 19'h2000;
                            ly_cnt = 0;
                            raw_adr = raw_adr + 1;
                            raw_cnt = raw_cnt + 1;
                            lyt[0] = lym0;
                            lyt[1] = lym1;
                            lyt[2] = lym2;
                            lyt[3] = lym3;
                            lyt[4] = lym4;
                            lyt[5] = lym5;
                            if (raw_cnt == raw_bins) 
                            begin
                                if (frame_count[1:0] == 0) state = 21;
                                else state = 20;
                            end
                        end
                    end
                    else wg_cnt = wg_cnt + 1;
                end
                20 : 
                begin
                    daqw = 19'h3000;
                    if (frame_count[1:0] == 0) state = 21;
                end
                21 : 
                begin
                    state = 22;
                    daqw = 19'hde0d;
                    crccalc = 4;
                end
                22 : 
                begin
                    state = 23;
                    daqw = 19'h0;
                    crccalc = 2;
                end
                23 : 
                begin
                    state = 24;
                    daqw = 19'h0;
                    crccalc = 3;
                end
                24 : 
                begin
                    state = 0;
                    daqw = {8'b00111010, frame_count};
                    readout_count = readout_count + 1;
                    crccalc = 0;
                end
                default : state = 0;
            endcase
            frame_count = frame_count + 1;
            l1a_procr = l1a_proc;
            valorr = valor;
            {best1d, best2d, bxnd} = {best1e, best2e, bxne};
            bxnr = bxn;
        end
    end
endmodule
