// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : trigger_rl.v
// Timestamp : Fri Mar 22 16:34:01 2019

module trigger_rl
(
    ly0p,
    ly1p,
    ly2p,
    ly3p,
    ly4p,
    ly5p,
    collmask,
    PromoteColl,
    hp,
    hnp,
    hfap,
    hpatbp,
    hv,
    lp,
    lnp,
    lfap,
    lpatbp,
    lv,
    drifttime,
    pretrig,
    trig,
    trig_mode,
    acc_pretrig,
    acc_trig,
    actv_feb_fg,
    trig_stop,
    clk
);

    input [111:0] ly0p;
    input [111:0] ly1p;
    input [111:0] ly2p;
    input [111:0] ly3p;
    input [111:0] ly4p;
    input [111:0] ly5p;
    input [391:0] collmask;
    input PromoteColl;
    output [1:0] hp;
    output [6:0] hnp;
    output hfap;
    output hpatbp;
    output hv;
    output [1:0] lp;
    output [6:0] lnp;
    output lfap;
    output lpatbp;
    output lv;
    input [2:0] drifttime;
    input [2:0] pretrig;
    input [2:0] trig;
    input [1:0] trig_mode;
    input [2:0] acc_pretrig;
    input [2:0] acc_trig;
    output actv_feb_fg;
    reg    actv_feb_fg;
    input trig_stop;
    input clk;

    wire [111:0] ly0;
    wire [111:0] ly1;
    wire [111:0] ly2;
    wire [111:0] ly3;
    wire [111:0] ly4;
    wire [111:0] ly5;
    wire [111:0] qca0;
    wire [111:0] qca1;
    wire [111:0] qca2;
    wire [111:0] qca3;
    wire [111:0] qa0;
    wire [111:0] qa1;
    wire [111:0] qa2;
    wire [111:0] qa3;
    wire [6:0] bwc1w;
    wire [6:0] bwc2w;
    wire [1:0] bqc1w;
    wire [1:0] bqc2w;
    wire bvc1w;
    wire bvc2w;
    wire [6:0] bwa1w;
    wire [6:0] bwa2w;
    wire [1:0] bqa1w;
    wire [1:0] bqa2w;
    wire bva1w;
    wire bva2w;
    wire [6:0] bw1;
    wire [1:0] bq1;
    wire fa1;
    wire bv1;
    wire [6:0] bw2;
    wire [1:0] bq2;
    wire fa2;
    wire bv2;
    Stage0 ExtendPulses
    (
        ly0p,
        ly1p,
        ly2p,
        ly3p,
        ly4p,
        ly5p,
        ly0,
        ly1,
        ly2,
        ly3,
        ly4,
        ly5,
        trig_stop,
        clk
    );
    Stage1_rl FindPatterns
    (
        ly0,
        ly1,
        ly2,
        ly3,
        ly4,
        ly5,
        collmask,
        drifttime,
        pretrig,
        trig,
        trig_mode,
        acc_pretrig,
        acc_trig,
        qca0,
        qca1,
        qca2,
        qca3,
        qa0,
        qa1,
        qa2,
        qa3,
        trig_stop,
        clk
    );
    collider cc
    (
        qca0,
        qca1,
        qca2,
        qca3,
        bwc1w,
        bwc2w,
        bqc1w,
        bqc2w,
        bvc1w,
        bvc2w,
        clk
    );
    collider ca
    (
        qa0,
        qa1,
        qa2,
        qa3,
        bwa1w,
        bwa2w,
        bqa1w,
        bqa2w,
        bva1w,
        bva2w,
        clk
    );
    promoter_rl pr
    (
        bwc1w,
        bqc1w,
        bvc1w,
        bwc2w,
        bqc2w,
        bvc2w,
        bwa1w,
        bqa1w,
        bva1w,
        bwa2w,
        bqa2w,
        bva2w,
        bw1,
        bq1,
        fa1,
        bv1,
        bw2,
        bq2,
        fa2,
        bv2,
        PromoteColl,
        clk
    );
    assign hv = bv1;
    assign hp = bq1;
    assign hnp = bw1;
    assign hfap = fa1;
    assign hpatbp = 0;
    assign lv = bv2;
    assign lp = bq2;
    assign lnp = bw2;
    assign lfap = fa2;
    assign lpatbp = 0;
    always @(posedge clk) 
    begin
        // if any pattern is detected, set this output. This is necessary for CFEBs
        actv_feb_fg = (((((((|qca0) | (|qca1)) | (|qca2)) | (|qca3)) | (|qa0)) | (|qa1)) | (|qa2)) | (|qa3);
    end
endmodule
