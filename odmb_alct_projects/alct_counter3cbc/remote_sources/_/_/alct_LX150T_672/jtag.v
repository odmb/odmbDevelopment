// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : jtag.v
// Timestamp : Fri Mar 22 16:34:01 2019

module jtag
(
    tck,
    tms,
    tdi,
    tdo,
    HCmask,
    collmask,
    ParamReg,
    ConfgReg,
    tst_pls,
    din_dly,
    dout_dly,
    clk_dly,
    input_dis,
    YR,
    OS,
    OSre,
    adc_sck,
    adc_sdi,
    adc_ncs,
    adc_sdo,
    adc_eoc,
    hard_rst,
    jstate,
    ID,
    TrigReg,
    SNout,
    SNin,
    hcounters,
    clk
);

    input tck;
    input tms;
    input tdi;
    output tdo;
    reg    tdo;
    output [671:0] HCmask;
    reg    [671:0] HCmask;
    output [391:0] collmask;
    reg    [391:0] collmask;
    output [8:0] ParamReg;
    reg    [8:0] ParamReg;
    output [68:0] ConfgReg;
    reg    [68:0] ConfgReg;
    output tst_pls;
    reg    tst_pls;
    output din_dly;
    reg    din_dly;
    input [6:0] dout_dly;
    output clk_dly;
    output input_dis;
    reg    input_dis;
    output [30:0] YR;
    reg    [30:0] YR;
    input [50:0] OS;
    output OSre;
    reg    OSre;
    output adc_sck;
    output adc_sdi;
    output adc_ncs;
    input adc_sdo;
    input adc_eoc;
    input hard_rst;
    output [3:0] jstate;
    input [39:0] ID;
    output [4:0] TrigReg;
    reg    [4:0] TrigReg;
    output SNout;
    reg    SNout;
    input SNin;
    input [95:0] hcounters;
    input clk;

    parameter IRsize = 4;
    parameter SRsize = 4;
    parameter HCsize = 671;
    parameter cmsize = 391;
    parameter PRsize = 8;
    parameter CRsize = 68;
    parameter YRsize = 30;
    parameter OSsize = 50;
    parameter TRsize = 4;
    parameter IDsize = 39;
    parameter CNsize = 95;
    parameter RunTestIdle = 1;
    parameter TestLogicReset = 0;
    parameter SelDRScan = 2;
    parameter CaptureDR = 3;
    parameter ShiftDR = 4;
    parameter Exit1DR = 5;
    parameter PauseDR = 6;
    parameter Exit2DR = 7;
    parameter UpdateDR = 8;
    parameter SelIRScan = 9;
    parameter CaptureIR = 10;
    parameter ShiftIR = 11;
    parameter Exit1IR = 12;
    parameter PauseIR = 13;
    parameter Exit2IR = 14;
    parameter UpdateIR = 15;
    parameter IDRead = 0;
    parameter HCMaskRead = 1;
    parameter HCMaskWrite = 2;
    parameter RdTrig = 3;
    parameter WrTrig = 4;
    parameter RdCfg = 6;
    parameter WrCfg = 7;
    parameter Wdly = 13;
    parameter Rdly = 14;
    parameter YRwrite = 25;
    parameter YRread = 16;
    parameter CNread = 17;
    parameter ADCread = 8;
    parameter ADCwrite = 9;
    parameter CollMaskRead = 19;
    parameter CollMaskWrite = 20;
    parameter ParamRegRead = 21;
    parameter ParamRegWrite = 22;
    parameter InputEnable = 23;
    parameter InputDisable = 24;
    parameter OSread = 26;
    parameter SNread = 27;
    parameter SNwrite0 = 28;
    parameter SNwrite1 = 29;
    parameter SNreset = 30;
    parameter Bypass = 31;
    parameter SNidleST = 0;
    parameter SNwriteST = 1;
    parameter SNreadST = 2;
    parameter SNsampleST = 3;
    reg [8:0] ParamRegs;
    reg [68:0] ConfgRegs;
    reg dly_clk_en;
    reg [3:0] TAPstate;
    reg [4:0] IR;
    reg bpass;
    reg [4:0] sr;
    reg [14:0] tdomux;
    reg dly_tdo;
    reg [30:0] YRs;
    reg [50:0] OSs;
    reg [4:0] TrigRegs;
    reg [39:0] IDs;
    reg [11:0] SNcnt;
    reg SNrd;
    reg SNresetRQ;
    reg SNwrite0RQ;
    reg SNwrite1RQ;
    reg SNreadRQ;
    reg SNresetRQ1;
    reg SNwrite0RQ1;
    reg SNwrite1RQ1;
    reg SNreadRQ1;
    reg SNresetRQ2;
    reg SNwrite0RQ2;
    reg SNwrite1RQ2;
    reg SNreadRQ2;
    reg [1:0] SNstate;
    reg [95:0] hcounterss;
initial input_dis = 0;
initial TAPstate = RunTestIdle;
    reg [4:0] adc_wr_reg;
    wire [4:0] adc_rd_reg;
    reg [4:0] adc_wr_sr;
    reg [4:0] adc_rd_sr;
    assign adc_sck = adc_wr_reg[0];
    assign adc_sdi = adc_wr_reg[1];
    assign adc_ncs = adc_wr_reg[2];
    assign adc_rd_reg[0] = adc_wr_reg[0];
    assign adc_rd_reg[1] = adc_wr_reg[1];
    assign adc_rd_reg[2] = adc_wr_reg[2];
    assign adc_rd_reg[3] = adc_sdo;
    assign adc_rd_reg[4] = adc_eoc;
    always @(posedge tck or negedge hard_rst) 
    begin
        if (hard_rst == 0) 
        begin
            collmask = 0;
            collmask = ~collmask;
            HCmask = 0;
            HCmask = ~HCmask;
            ParamReg = 9'b1111111_01;
            ConfgReg = 69'b01_0_00_00_1_0_0_000_101_0_0001_0011_01111000_000_01_00001_00111_11_100_010_00000001_0_0_0_00;
            input_dis = 0;
            TAPstate = RunTestIdle;
            adc_wr_reg[0] = 0;
            adc_wr_reg[1] = 0;
            adc_wr_reg[2] = 1;
            adc_wr_reg[3] = 0;
            adc_wr_reg[4] = 0;
        end
        else 
        begin
            dly_tdo = |(dout_dly & (~ParamReg[8:2]));
            dly_clk_en = 0;
            OSre = 0;
            case (TAPstate)
                RunTestIdle : TAPstate = (tms == 0) ? RunTestIdle : SelDRScan;
                TestLogicReset : TAPstate = (tms == 0) ? RunTestIdle : TestLogicReset;
                CaptureDR : 
                begin
                    TAPstate = (tms == 0) ? ShiftDR : Exit1DR;
                    case (IR)
                        HCMaskWrite, HCMaskRead : tdomux = 1;
                        CollMaskWrite, CollMaskRead : tdomux = 2;
                        ParamRegWrite : tdomux = 4;
                        ParamRegRead : 
                        begin
                            tdomux = 4;
                            ParamRegs = ParamReg;
                        end
                        WrCfg : tdomux = 8;
                        RdCfg : 
                        begin
                            tdomux = 8;
                            ConfgRegs = ConfgReg;
                        end
                        Wdly, Rdly : tdomux = 16;
                        Bypass : 
                        begin
                            tdomux = 32;
                            bpass = 0;
                        end
                        OSread : 
                        begin
                            tdomux = 128;
                            OSs = OS;
                            OSre = 1;
                        end
                        WrTrig : tdomux = 256;
                        RdTrig : 
                        begin
                            tdomux = 256;
                            TrigRegs = TrigReg;
                        end
                        IDRead : 
                        begin
                            tdomux = 512;
                            IDs = ID;
                        end
                        SNread : tdomux = 1024;
                        YRwrite : tdomux = 2048;
                        YRread : 
                        begin
                            tdomux = 2048;
                            YRs = YR;
                        end
                        CNread : 
                        begin
                            tdomux = 4096;
                            hcounterss = hcounters;
                        end
                        ADCread : 
                        begin
                            tdomux = 8192;
                            adc_rd_sr = adc_rd_reg;
                        end
                        ADCwrite : 
                        begin
                            tdomux = 16384;
                            adc_wr_sr = adc_wr_reg;
                        end
                        default : tdomux = 0;
                    endcase
                end
                ShiftDR : 
                begin
                    TAPstate = (tms == 0) ? ShiftDR : Exit1DR;
                    case (IR)
                        HCMaskWrite, HCMaskRead : HCmask = {tdi, HCmask[HCsize:1]};
                        CollMaskWrite, CollMaskRead : collmask = {tdi, collmask[cmsize:1]};
                        ParamRegWrite, ParamRegRead : ParamRegs = {tdi, ParamRegs[PRsize:1]};
                        RdCfg, WrCfg : ConfgRegs = {tdi, ConfgRegs[CRsize:1]};
                        Bypass : bpass = tdi;
                        Wdly, Rdly : 
                        begin
                            din_dly = tdi;
                            dly_clk_en = 1;
                        end
                        YRwrite, YRread : YRs = {tdi, YRs[YRsize:1]};
                        CNread : hcounterss = {tdi, hcounterss[CNsize:1]};
                        OSread : OSs = {tdi, OSs[OSsize:1]};
                        RdTrig, WrTrig : TrigRegs = {tdi, TrigRegs[TRsize:1]};
                        IDRead : IDs = {tdi, IDs[IDsize:1]};
                        ADCread : adc_rd_sr = {tdi, adc_rd_sr[4:1]};
                        ADCwrite : adc_wr_sr = {tdi, adc_wr_sr[4:1]};
                    endcase
                end
                UpdateDR : 
                begin
                    TAPstate = (tms == 0) ? RunTestIdle : SelDRScan;
                    case (IR)
                        ParamRegWrite : ParamReg = ParamRegs;
                        WrTrig : 
                        begin
                            TrigReg = TrigRegs;
                            tst_pls = (TrigRegs[3:0] == 3) ? 1 : 0;
                        end
                        YRwrite : YR = YRs;
                        WrCfg : ConfgReg = ConfgRegs;
                        ADCwrite : adc_wr_reg = adc_wr_sr;
                    endcase
                end
                SelDRScan : TAPstate = (tms == 0) ? CaptureDR : SelIRScan;
                Exit1DR : TAPstate = (tms == 0) ? PauseDR : UpdateDR;
                PauseDR : TAPstate = (tms == 0) ? PauseDR : Exit2DR;
                Exit2DR : TAPstate = (tms == 0) ? ShiftDR : UpdateDR;
                CaptureIR : 
                begin
                    TAPstate = (tms == 0) ? ShiftIR : Exit1IR;
                    sr = IR;
                    tdomux = 64;
                end
                ShiftIR : 
                begin
                    TAPstate = (tms == 0) ? ShiftIR : Exit1IR;
                    sr = {tdi, sr[SRsize:1]};
                end
                UpdateIR : 
                begin
                    TAPstate = (tms == 0) ? RunTestIdle : SelDRScan;
                    IR = sr;
                    case (IR)
                        InputEnable : input_dis = 0;
                        InputDisable : input_dis = 1;
                        SNreset : SNresetRQ = ~SNresetRQ;
                        SNwrite0 : SNwrite0RQ = ~SNwrite0RQ;
                        SNwrite1 : SNwrite1RQ = ~SNwrite1RQ;
                        SNread : SNreadRQ = ~SNreadRQ;
                    endcase
                end
                SelIRScan : TAPstate = (tms == 0) ? CaptureIR : TestLogicReset;
                Exit1IR : TAPstate = (tms == 0) ? PauseIR : UpdateIR;
                PauseIR : TAPstate = (tms == 0) ? PauseIR : Exit2IR;
                Exit2IR : TAPstate = (tms == 0) ? ShiftIR : UpdateIR;
            endcase
        end
    end
    assign clk_dly = (dly_clk_en) ? !tck : 0;
    always @(negedge tck) 
    begin
        tdo = ((((((((((((tdomux[0] & HCmask[0]) | (tdomux[1] & collmask[0])) | (tdomux[2] & ParamRegs[0])) | (tdomux[3] & ConfgRegs[0])) | (tdomux[4] & dly_tdo)) | (tdomux[5] & bpass)) | (tdomux[6] & sr[0])) | (tdomux[7] & OSs[0])) | (tdomux[8] & TrigRegs[0])) | (tdomux[9] & IDs[0])) | (tdomux[10] & SNrd)) | (tdomux[11] & YRs[0])) | (tdomux[12] & hcounterss[0]);
        tdo = (tdo | (tdomux[13] & adc_rd_sr[0])) | (tdomux[14] & adc_wr_sr[0]);
    end
    assign jstate = ~TAPstate;
    always @(posedge clk) 
    begin
        case (SNstate)
            SNidleST : 
            begin
                if (SNresetRQ2 ^ SNresetRQ1) 
                begin
                    SNout = 0;
                end
                if (SNwrite0RQ2 ^ SNwrite0RQ1) 
                begin
                    SNstate = SNwriteST;
                    SNout = 0;
                    SNcnt = 2400;
                end
                if (SNwrite1RQ2 ^ SNwrite1RQ1) 
                begin
                    SNstate = SNwriteST;
                    SNout = 0;
                    SNcnt = 240;
                end
                if (SNreadRQ2 ^ SNreadRQ1) 
                begin
                    SNstate = SNreadST;
                    SNout = 0;
                    SNcnt = 240;
                end
            end
            SNwriteST : 
            begin
                if (SNcnt == 0) 
                begin
                    SNstate = SNidleST;
                    SNout = 1;
                end
                else SNcnt = SNcnt - 1;
            end
            SNreadST : 
            begin
                if (SNcnt == 0) 
                begin
                    SNstate = SNsampleST;
                    SNcnt = 360;
                    SNout = 1;
                end
                else SNcnt = SNcnt - 1;
            end
            SNsampleST : 
            begin
                if (SNcnt == 0) 
                begin
                    SNstate = SNidleST;
                    SNrd = SNin;
                end
                else SNcnt = SNcnt - 1;
            end
        endcase
        SNresetRQ2 = SNresetRQ1;
        SNwrite0RQ2 = SNwrite0RQ1;
        SNwrite1RQ2 = SNwrite1RQ1;
        SNreadRQ2 = SNreadRQ1;
        SNresetRQ1 = SNresetRQ;
        SNwrite0RQ1 = SNwrite0RQ;
        SNwrite1RQ1 = SNwrite1RQ;
        SNreadRQ1 = SNreadRQ;
    end
endmodule
