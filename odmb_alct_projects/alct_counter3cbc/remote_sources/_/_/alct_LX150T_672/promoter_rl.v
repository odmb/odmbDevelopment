// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : promoter_rl.v
// Timestamp : Fri Mar 22 16:34:02 2019

module promoter_rl
(
    wc1,
    qc1,
    vc1,
    wc2,
    qc2,
    vc2,
    wa1,
    qa1,
    va1,
    wa2,
    qa2,
    va2,
    bw1,
    bq1,
    fa1,
    bv1,
    bw2,
    bq2,
    fa2,
    bv2,
    p,
    clk
);

    input [6:0] wc1;
    input [1:0] qc1;
    input vc1;
    input [6:0] wc2;
    input [1:0] qc2;
    input vc2;
    input [6:0] wa1;
    input [1:0] qa1;
    input va1;
    input [6:0] wa2;
    input [1:0] qa2;
    input va2;
    output [6:0] bw1;
    reg    [6:0] bw1;
    output [1:0] bq1;
    reg    [1:0] bq1;
    output fa1;
    reg    fa1;
    output bv1;
    reg    bv1;
    output [6:0] bw2;
    reg    [6:0] bw2;
    output [1:0] bq2;
    reg    [1:0] bq2;
    output fa2;
    reg    fa2;
    output bv2;
    reg    bv2;
    input p;
    input clk;

    reg c1c2;
    reg c1a1;
    reg c1a2;
    reg c2a1;
    reg c2a2;
    reg a1a2;
    reg [2:0] rc1;
    reg [2:0] rc2;
    reg [2:0] ra1;
    reg [2:0] ra2;
    reg b1c1;
    reg b1c2;
    reg b1a1;
    reg b1a2;
    reg b2c1;
    reg b2c2;
    reg b2a1;
    reg b2a2;
    reg [6:0] wc1and1;
    reg [1:0] qc1and1;
    reg [6:0] wc2and1;
    reg [1:0] qc2and1;
    reg [6:0] wa1and1;
    reg [1:0] qa1and1;
    reg [6:0] wa2and1;
    reg [1:0] qa2and1;
    reg [6:0] wc1and2;
    reg [1:0] qc1and2;
    reg [6:0] wc2and2;
    reg [1:0] qc2and2;
    reg [6:0] wa1and2;
    reg [1:0] qa1and2;
    reg [6:0] wa2and2;
    reg [1:0] qa2and2;
    reg vc1and1;
    reg vc2and1;
    reg va1and1;
    reg va2and1;
    reg vc1and2;
    reg vc2and2;
    reg va1and2;
    reg va2and2;
    reg vc1r;
    reg vc2r;
    reg va1r;
    reg va2r;
    reg [1:0] qc1r;
    reg [1:0] qc2r;
    reg [1:0] qa1r;
    reg [1:0] qa2r;
    reg [6:0] wc1r;
    reg [6:0] wc2r;
    reg [6:0] wa1r;
    reg [6:0] wa2r;
    always @(posedge clk) 
    begin
        c1c2 = (qc1 >= qc2) && (vc1 >= vc2);
        a1a2 = (qa1 >= qa2) && (va1 >= va2);
        c1a1 = ((qc1 > qa1) && (!p)) || (((qc1 >= qa1) && p) && (vc1 >= va1));
        c1a2 = ((qc1 > qa2) && (!p)) || (((qc1 >= qa2) && p) && (vc1 >= va2));
        c2a1 = ((qc2 > qa1) && (!p)) || (((qc2 >= qa1) && p) && (vc2 >= va1));
        c2a2 = ((qc2 > qa2) && (!p)) || (((qc2 >= qa2) && p) && (vc2 >= va2));
        rc1 = {c1c2, c1a1, c1a2};
        rc2 = {!c1c2, c2a1, c2a2};
        ra1 = {a1a2, !c1a1, !c2a1};
        ra2 = {!a1a2, !c1a2, !c2a2};
        vc1r = vc1;
        vc2r = vc2;
        va1r = va1;
        va2r = va2;
        wc1r = wc1;
        qc1r = qc1;
        wc2r = wc2;
        qc2r = qc2;
        wa1r = wa1;
        qa1r = qa1;
        wa2r = wa2;
        qa2r = qa2;
    end
    always @(rc1 or rc2 or ra1 or ra2 or vc1r or vc2r or va1r or va2r or wc1r or qc1r or wc2r or qc2r or wa1r or qa1r or wa2r or qa2r) 
    begin
        bw1 = 0;
        bq1 = 0;
        fa1 = 0;
        bw2 = 0;
        bq2 = 0;
        fa2 = 0;
        b1c1 = rc1 == 7;
        b1c2 = rc2 == 7;
        b1a1 = ra1 == 7;
        b1a2 = ra2 == 7;
        b2c1 = ((rc1 == 6) || (rc1 == 5)) || (rc1 == 3);
        b2c2 = ((rc2 == 6) || (rc2 == 5)) || (rc2 == 3);
        b2a1 = ((ra1 == 6) || (ra1 == 5)) || (ra1 == 3);
        b2a2 = ((ra2 == 6) || (ra2 == 5)) || (ra2 == 3);
        vc1and1 = b1c1 && vc1r;
        wc1and1 = (b1c1 && vc1r) ? wc1r : 0;
        qc1and1 = (b1c1 && vc1r) ? qc1r : 0;
        vc2and1 = b1c2 && vc2r;
        wc2and1 = (b1c2 && vc2r) ? wc2r : 0;
        qc2and1 = (b1c2 && vc2r) ? qc2r : 0;
        va1and1 = b1a1 && va1r;
        wa1and1 = (b1a1 && va1r) ? wa1r : 0;
        qa1and1 = (b1a1 && va1r) ? qa1r : 0;
        va2and1 = b1a2 && va2r;
        wa2and1 = (b1a2 && va2r) ? wa2r : 0;
        qa2and1 = (b1a2 && va2r) ? qa2r : 0;
        vc1and2 = b2c1 && vc1r;
        wc1and2 = (b2c1 && vc1r) ? wc1r : 0;
        qc1and2 = (b2c1 && vc1r) ? qc1r : 0;
        vc2and2 = b2c2 && vc2r;
        wc2and2 = (b2c2 && vc2r) ? wc2r : 0;
        qc2and2 = (b2c2 && vc2r) ? qc2r : 0;
        va1and2 = b2a1 && va1r;
        wa1and2 = (b2a1 && va1r) ? wa1r : 0;
        qa1and2 = (b2a1 && va1r) ? qa1r : 0;
        va2and2 = b2a2 && va2r;
        wa2and2 = (b2a2 && va2r) ? wa2r : 0;
        qa2and2 = (b2a2 && va2r) ? qa2r : 0;
        bv1 = ((vc1and1 | vc2and1) | va1and1) | va2and1;
        bw1 = ((wc1and1 | wc2and1) | wa1and1) | wa2and1;
        bq1 = ((qc1and1 | qc2and1) | qa1and1) | qa2and1;
        fa1 = b1a1 || b1a2;
        bv2 = ((vc1and2 | vc2and2) | va1and2) | va2and2;
        bw2 = ((wc1and2 | wc2and2) | wa1and2) | wa2and2;
        bq2 = ((qc1and2 | qc2and2) | qa1and2) | qa2and2;
        fa2 = b2a1 || b2a2;
    end
endmodule
