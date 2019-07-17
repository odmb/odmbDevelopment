// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : Stage0.v
// Timestamp : Fri Mar 22 16:34:01 2019

module Stage0
(
    ly0,
    ly1,
    ly2,
    ly3,
    ly4,
    ly5,
    lyr0,
    lyr1,
    lyr2,
    lyr3,
    lyr4,
    lyr5,
    trig_stop,
    clk
);

    input [111:0] ly0;
    input [111:0] ly1;
    input [111:0] ly2;
    input [111:0] ly3;
    input [111:0] ly4;
    input [111:0] ly5;
    output [111:0] lyr0;
    output [111:0] lyr1;
    output [111:0] lyr2;
    output [111:0] lyr3;
    output [111:0] lyr4;
    output [111:0] lyr5;
    input trig_stop;
    input clk;

     //this module one-shots the whole chamber
    LyOneShot lsh0
    (
        ly0,
        lyr0,
        trig_stop,
        clk
    );
    LyOneShot lsh1
    (
        ly1,
        lyr1,
        trig_stop,
        clk
    );
    LyOneShot lsh2
    (
        ly2,
        lyr2,
        trig_stop,
        clk
    );
    LyOneShot lsh3
    (
        ly3,
        lyr3,
        trig_stop,
        clk
    );
    LyOneShot lsh4
    (
        ly4,
        lyr4,
        trig_stop,
        clk
    );
    LyOneShot lsh5
    (
        ly5,
        lyr5,
        trig_stop,
        clk
    );
endmodule
