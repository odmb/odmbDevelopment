// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : Patterner_rl.v
// Timestamp : Fri Mar 22 16:34:01 2019

module Patterner_rl
(
    ly0,
    ly1,
    ly2,
    ly3,
    ly4,
    ly5,
    collmask,
    sacp,
    vacp,
    sa,
    va,
    drifttime,
    pretrig,
    trig,
    acc_pretrig,
    acc_trig,
    trig_mode,
    clk
);

    input [2:0] ly0;
    input [1:0] ly1;
    input ly2;
    input [1:0] ly3;
    input [2:0] ly4;
    input [2:0] ly5;
    input [27:0] collmask;
    output [1:0] sacp;
    reg    [1:0] sacp;
    output vacp;
    reg    vacp;
    output [1:0] sa;
    reg    [1:0] sa;
    output va;
    reg    va;
    input [2:0] drifttime;
    input [2:0] pretrig;
    input [2:0] trig;
    input [2:0] acc_pretrig;
    input [2:0] acc_trig;
    input [1:0] trig_mode;
    input clk;

    reg [2:0] lya0cm;
    reg [1:0] lya1cm;
    reg lya2cm;
    reg [1:0] lya3cm;
    reg [2:0] lya4cm;
    reg [2:0] lya5cm;
    reg [2:0] lyb0cm;
    reg [1:0] lyb1cm;
    reg lyb2cm;
    reg [1:0] lyb3cm;
    reg [2:0] lyb4cm;
    reg [2:0] lyb5cm;
    reg ly0am;
    reg ly4am;
    reg ly5am;
    reg ly1am;
    reg ly3am;
    reg ly2am;
    reg [2:0] sumac;
    reg [2:0] suma;
    reg [2:0] bxac;
    reg [2:0] bxa;
    always @(ly0 or ly1 or ly2 or ly3 or ly4 or ly5 or collmask or drifttime or pretrig or trig or trig_mode or bxac or bxa or acc_pretrig or acc_trig) 
    begin
        ly0am = ly0[2];
        ly1am = ly1[1];
        ly2am = ly2;
        ly3am = ly3[0];
        ly4am = ly4[0];
        ly5am = ly5[0];
         //count the bits in the accelerator muon pattern
        suma = ((((((ly0am) ? 3'b1 : 3'b0) + ((ly1am) ? 3'b1 : 3'b0)) + ((ly2am) ? 3'b1 : 3'b0)) + ((ly3am) ? 3'b1 : 3'b0)) + ((ly4am) ? 3'b1 : 3'b0)) + ((ly5am) ? 3'b1 : 3'b0);
        sa = (suma >= 3) ? suma - 3 : 0;
        va = (bxa == drifttime) && (suma >= acc_trig);
         //mask out all bits which are not used in the collision pattern a
        lya0cm = ly0 & collmask[2:0];
        lya1cm = ly1 & collmask[4:3];
        lya2cm = ly2 & collmask[5];
        lya3cm = ly3 & collmask[7:6];
        lya4cm = ly4 & collmask[10:8];
        lya5cm = ly5 & collmask[13:11];
         //count the bits in the collision pattern a
        sumac = (((((((lya0cm[0] | lya0cm[1]) | lya0cm[2]) ? 3'b1 : 3'b0) + ((lya1cm[0] | lya1cm[1]) ? 3'b1 : 3'b0)) + ((lya2cm) ? 3'b1 : 3'b0)) + ((lya3cm[0] | lya3cm[1]) ? 3'b1 : 3'b0)) + (((lya4cm[0] | lya4cm[1]) | lya4cm[2]) ? 3'b1 : 3'b0)) + (((lya5cm[0] | lya5cm[1]) | lya5cm[2]) ? 3'b1 : 3'b0);
        sacp = (sumac >= 3) ? sumac - 3 : 0;
        vacp = (bxac == drifttime) && (sumac >= trig);
         //trig_mode == 3 kills coll muon if there is acc muon
        if ((trig_mode == 3) && va) 
        begin
            vacp = 0;
        end
    end
    always @(posedge clk) 
    begin
         //BX counters are reset by the number of hits < 2, they stop counting at maximum count.
        bxac = ((sumac < pretrig) || (trig_mode == 1)) ? 0 : (bxac == 7) ? 7 : bxac + 1;
         //trig_mode == 1 kills coll muon
        bxa = ((suma < acc_pretrig) || (trig_mode == 2)) ? 0 : (bxa == 7) ? 7 : bxa + 1;
         //trig_mode == 2 kills acc  muon
    end
endmodule
