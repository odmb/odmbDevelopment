// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : ecc32_encode.v
// Timestamp : Fri Mar 22 16:34:01 2019

module ecc32_encode
(
    enc_in,
    enc_out,
    parity_out,
    clk
);

    input [31:0] enc_in;
    output [31:0] enc_out;
    reg    [31:0] enc_out;
    output [6:0] parity_out;
    input clk;

    wire [6:0] enc_chk;
    always @(posedge clk) 
    begin
        enc_out = enc_in;
    end
    assign enc_chk[0] = ((((((((((((((((enc_out[0] ^ enc_out[1]) ^ enc_out[3]) ^ enc_out[4]) ^ enc_out[6]) ^ enc_out[8]) ^ enc_out[10]) ^ enc_out[11]) ^ enc_out[13]) ^ enc_out[15]) ^ enc_out[17]) ^ enc_out[19]) ^ enc_out[21]) ^ enc_out[23]) ^ enc_out[25]) ^ enc_out[26]) ^ enc_out[28]) ^ enc_out[30];
    assign enc_chk[1] = ((((((((((((((((enc_out[0] ^ enc_out[2]) ^ enc_out[3]) ^ enc_out[5]) ^ enc_out[6]) ^ enc_out[9]) ^ enc_out[10]) ^ enc_out[12]) ^ enc_out[13]) ^ enc_out[16]) ^ enc_out[17]) ^ enc_out[20]) ^ enc_out[21]) ^ enc_out[24]) ^ enc_out[25]) ^ enc_out[27]) ^ enc_out[28]) ^ enc_out[31];
    assign enc_chk[2] = ((((((((((((((((enc_out[1] ^ enc_out[2]) ^ enc_out[3]) ^ enc_out[7]) ^ enc_out[8]) ^ enc_out[9]) ^ enc_out[10]) ^ enc_out[14]) ^ enc_out[15]) ^ enc_out[16]) ^ enc_out[17]) ^ enc_out[22]) ^ enc_out[23]) ^ enc_out[24]) ^ enc_out[25]) ^ enc_out[29]) ^ enc_out[30]) ^ enc_out[31];
    assign enc_chk[3] = (((((((((((((enc_out[4] ^ enc_out[5]) ^ enc_out[6]) ^ enc_out[7]) ^ enc_out[8]) ^ enc_out[9]) ^ enc_out[10]) ^ enc_out[18]) ^ enc_out[19]) ^ enc_out[20]) ^ enc_out[21]) ^ enc_out[22]) ^ enc_out[23]) ^ enc_out[24]) ^ enc_out[25];
    assign enc_chk[4] = (((((((((((((enc_out[11] ^ enc_out[12]) ^ enc_out[13]) ^ enc_out[14]) ^ enc_out[15]) ^ enc_out[16]) ^ enc_out[17]) ^ enc_out[18]) ^ enc_out[19]) ^ enc_out[20]) ^ enc_out[21]) ^ enc_out[22]) ^ enc_out[23]) ^ enc_out[24]) ^ enc_out[25];
    assign enc_chk[5] = ((((enc_out[26] ^ enc_out[27]) ^ enc_out[28]) ^ enc_out[29]) ^ enc_out[30]) ^ enc_out[31];
    assign enc_chk[6] = ((((((((((((((((((((((((((((((((((((enc_out[0] ^ enc_out[1]) ^ enc_out[2]) ^ enc_out[3]) ^ enc_out[4]) ^ enc_out[5]) ^ enc_out[6]) ^ enc_out[7]) ^ enc_out[8]) ^ enc_out[9]) ^ enc_out[10]) ^ enc_out[11]) ^ enc_out[12]) ^ enc_out[13]) ^ enc_out[14]) ^ enc_out[15]) ^ enc_out[16]) ^ enc_out[17]) ^ enc_out[18]) ^ enc_out[19]) ^ enc_out[20]) ^ enc_out[21]) ^ enc_out[22]) ^ enc_out[23]) ^ enc_out[24]) ^ enc_out[25]) ^ enc_out[26]) ^ enc_out[27]) ^ enc_out[28]) ^ enc_out[29]) ^ enc_out[30]) ^ enc_out[31]) ^ enc_chk[5]) ^ enc_chk[4]) ^ enc_chk[3]) ^ enc_chk[2]) ^ enc_chk[1]) ^ enc_chk[0];
    assign parity_out = enc_chk;
endmodule
