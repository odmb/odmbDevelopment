// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : CheckNeighbors_rl.v
// Timestamp : Fri Mar 22 16:34:02 2019

module CheckNeighbors_rl
(
    vc,
    sc,
    vcr,
    vctop,
    sctop,
    vcbot,
    scbot,
    va,
    sa,
    varr,
    vatop,
    satop,
    vabot,
    sabot,
    trig_stop,
    clk
);

    input vc;
    input [1:0] sc;
    output vcr;
    reg    vcr;
    input vctop;
    input [1:0] sctop;
    input vcbot;
    input [1:0] scbot;
    input va;
    input [1:0] sa;
    output varr;
    reg    varr;
    input vatop;
    input [1:0] satop;
    input vabot;
    input [1:0] sabot;
    input trig_stop;
    input clk;

    parameter KILLTIME = 4;
    reg [2:0] cntc;
    reg [2:0] cnta;
    reg [2:0] cntcn;
    reg [2:0] cntan;
    always @(sc or sctop or scbot or sa or satop or sabot or cntc or cnta or vc or va or vctop or vcbot or vatop or vabot) 
    begin
        cntcn = cntc;
        vcr = vc;
        if ((((sc <= sctop) && vctop) && vc) || (((sc < scbot) && vcbot) && vc)) 
        begin
            vcr = 0;
        end
        if (cntc > 0) 
        begin
            vcr = 0;
            cntcn = cntc - 1;
        end
        if ((vctop || vcbot) && (!vc)) 
        begin
            cntcn = KILLTIME;
        end
        cntan = cnta;
        varr = va;
        if ((((sa <= satop) && vatop) && va) || (((sa < sabot) && vabot) && va)) 
        begin
            varr = 0;
        end
        if (cnta > 0) 
        begin
            varr = 0;
            cntan = cnta - 1;
        end
        if ((vatop || vabot) && (!va)) 
        begin
            cntan = KILLTIME;
        end
    end
    always @(posedge clk) 
    begin
        if (trig_stop) 
        begin
            cntc = 0;
            cnta = 0;
        end
        else 
        begin
            cnta = cntan;
            cntc = cntcn;
        end
    end
endmodule
