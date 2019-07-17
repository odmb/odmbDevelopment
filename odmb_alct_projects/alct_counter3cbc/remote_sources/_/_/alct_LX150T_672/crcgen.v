// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : crcgen.v
// Timestamp : Fri Mar 22 16:34:02 2019

module crcgen
(
    d,
    crc,
    calc,
    dav,
    clk
);

    input [18:0] d;
    output [18:0] crc;
    reg    [18:0] crc;
    input [2:0] calc;
    input dav;
    input clk;

    reg [21:0] ncrc;
    reg [4:0] i;
    reg t;
    // This module implements CRC generation algorithm
    // with the following parameters:
    // Poly           = 10000000000000000000011
    // Data width     = 16
    // CRC width      = 22
    // CRC init       = 0
    // Data bit first = MSB
    always @(posedge clk) 
    begin
        case (calc)
            0 : 
            begin
                ncrc = 0;
                crc = d;
            end
            1 : 
            begin
                for (i = 16; i > 0; i = i - 1) 
                begin
                    t = d[i - 1] ^ ncrc[21];
                    ncrc[21:2] = ncrc[20:1];
                    ncrc[1] = t ^ ncrc[0];
                    ncrc[0] = t;
                end
                crc = d;
            end
            2 : 
            begin
                crc = {4'hd, 1'b0, ncrc[10:0]};
            end
            3 : 
            begin
                crc = {4'hd, 1'b0, ncrc[21:11]};
            end
            4 : 
            begin
                crc = d;
            end
        endcase
        crc[17] = dav;
    end
endmodule
