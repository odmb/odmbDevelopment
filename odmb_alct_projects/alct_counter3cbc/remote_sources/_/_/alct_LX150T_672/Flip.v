// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : Flip.v
// Timestamp : Fri Mar 22 16:34:01 2019

function [7:0] Flip;

    input [7:0] d;


    begin
        Flip[0] = d[7];
        Flip[1] = d[6];
        Flip[2] = d[5];
        Flip[3] = d[4];
        Flip[4] = d[3];
        Flip[5] = d[2];
        Flip[6] = d[1];
        Flip[7] = d[0];
    end
endfunction
