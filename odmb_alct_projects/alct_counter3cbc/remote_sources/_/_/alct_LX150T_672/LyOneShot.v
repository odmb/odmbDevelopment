// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : LyOneShot.v
// Timestamp : Fri Mar 22 16:34:01 2019

module LyOneShot
(
    ly,
    lyr,
    trig_stop,
    clk
);

    input [111:0] ly;
    output [111:0] lyr;
    input trig_stop;
    input clk;

     //this module one-shots the whole layer
    OneShot sh0
    (
        ly[0],
        lyr[0],
        trig_stop,
        clk
    );
    OneShot sh1
    (
        ly[1],
        lyr[1],
        trig_stop,
        clk
    );
    OneShot sh2
    (
        ly[2],
        lyr[2],
        trig_stop,
        clk
    );
    OneShot sh3
    (
        ly[3],
        lyr[3],
        trig_stop,
        clk
    );
    OneShot sh4
    (
        ly[4],
        lyr[4],
        trig_stop,
        clk
    );
    OneShot sh5
    (
        ly[5],
        lyr[5],
        trig_stop,
        clk
    );
    OneShot sh6
    (
        ly[6],
        lyr[6],
        trig_stop,
        clk
    );
    OneShot sh7
    (
        ly[7],
        lyr[7],
        trig_stop,
        clk
    );
    OneShot sh8
    (
        ly[8],
        lyr[8],
        trig_stop,
        clk
    );
    OneShot sh9
    (
        ly[9],
        lyr[9],
        trig_stop,
        clk
    );
    OneShot sh10
    (
        ly[10],
        lyr[10],
        trig_stop,
        clk
    );
    OneShot sh11
    (
        ly[11],
        lyr[11],
        trig_stop,
        clk
    );
    OneShot sh12
    (
        ly[12],
        lyr[12],
        trig_stop,
        clk
    );
    OneShot sh13
    (
        ly[13],
        lyr[13],
        trig_stop,
        clk
    );
    OneShot sh14
    (
        ly[14],
        lyr[14],
        trig_stop,
        clk
    );
    OneShot sh15
    (
        ly[15],
        lyr[15],
        trig_stop,
        clk
    );
    OneShot sh16
    (
        ly[16],
        lyr[16],
        trig_stop,
        clk
    );
    OneShot sh17
    (
        ly[17],
        lyr[17],
        trig_stop,
        clk
    );
    OneShot sh18
    (
        ly[18],
        lyr[18],
        trig_stop,
        clk
    );
    OneShot sh19
    (
        ly[19],
        lyr[19],
        trig_stop,
        clk
    );
    OneShot sh20
    (
        ly[20],
        lyr[20],
        trig_stop,
        clk
    );
    OneShot sh21
    (
        ly[21],
        lyr[21],
        trig_stop,
        clk
    );
    OneShot sh22
    (
        ly[22],
        lyr[22],
        trig_stop,
        clk
    );
    OneShot sh23
    (
        ly[23],
        lyr[23],
        trig_stop,
        clk
    );
    OneShot sh24
    (
        ly[24],
        lyr[24],
        trig_stop,
        clk
    );
    OneShot sh25
    (
        ly[25],
        lyr[25],
        trig_stop,
        clk
    );
    OneShot sh26
    (
        ly[26],
        lyr[26],
        trig_stop,
        clk
    );
    OneShot sh27
    (
        ly[27],
        lyr[27],
        trig_stop,
        clk
    );
    OneShot sh28
    (
        ly[28],
        lyr[28],
        trig_stop,
        clk
    );
    OneShot sh29
    (
        ly[29],
        lyr[29],
        trig_stop,
        clk
    );
    OneShot sh30
    (
        ly[30],
        lyr[30],
        trig_stop,
        clk
    );
    OneShot sh31
    (
        ly[31],
        lyr[31],
        trig_stop,
        clk
    );
    OneShot sh32
    (
        ly[32],
        lyr[32],
        trig_stop,
        clk
    );
    OneShot sh33
    (
        ly[33],
        lyr[33],
        trig_stop,
        clk
    );
    OneShot sh34
    (
        ly[34],
        lyr[34],
        trig_stop,
        clk
    );
    OneShot sh35
    (
        ly[35],
        lyr[35],
        trig_stop,
        clk
    );
    OneShot sh36
    (
        ly[36],
        lyr[36],
        trig_stop,
        clk
    );
    OneShot sh37
    (
        ly[37],
        lyr[37],
        trig_stop,
        clk
    );
    OneShot sh38
    (
        ly[38],
        lyr[38],
        trig_stop,
        clk
    );
    OneShot sh39
    (
        ly[39],
        lyr[39],
        trig_stop,
        clk
    );
    OneShot sh40
    (
        ly[40],
        lyr[40],
        trig_stop,
        clk
    );
    OneShot sh41
    (
        ly[41],
        lyr[41],
        trig_stop,
        clk
    );
    OneShot sh42
    (
        ly[42],
        lyr[42],
        trig_stop,
        clk
    );
    OneShot sh43
    (
        ly[43],
        lyr[43],
        trig_stop,
        clk
    );
    OneShot sh44
    (
        ly[44],
        lyr[44],
        trig_stop,
        clk
    );
    OneShot sh45
    (
        ly[45],
        lyr[45],
        trig_stop,
        clk
    );
    OneShot sh46
    (
        ly[46],
        lyr[46],
        trig_stop,
        clk
    );
    OneShot sh47
    (
        ly[47],
        lyr[47],
        trig_stop,
        clk
    );
    OneShot sh48
    (
        ly[48],
        lyr[48],
        trig_stop,
        clk
    );
    OneShot sh49
    (
        ly[49],
        lyr[49],
        trig_stop,
        clk
    );
    OneShot sh50
    (
        ly[50],
        lyr[50],
        trig_stop,
        clk
    );
    OneShot sh51
    (
        ly[51],
        lyr[51],
        trig_stop,
        clk
    );
    OneShot sh52
    (
        ly[52],
        lyr[52],
        trig_stop,
        clk
    );
    OneShot sh53
    (
        ly[53],
        lyr[53],
        trig_stop,
        clk
    );
    OneShot sh54
    (
        ly[54],
        lyr[54],
        trig_stop,
        clk
    );
    OneShot sh55
    (
        ly[55],
        lyr[55],
        trig_stop,
        clk
    );
    OneShot sh56
    (
        ly[56],
        lyr[56],
        trig_stop,
        clk
    );
    OneShot sh57
    (
        ly[57],
        lyr[57],
        trig_stop,
        clk
    );
    OneShot sh58
    (
        ly[58],
        lyr[58],
        trig_stop,
        clk
    );
    OneShot sh59
    (
        ly[59],
        lyr[59],
        trig_stop,
        clk
    );
    OneShot sh60
    (
        ly[60],
        lyr[60],
        trig_stop,
        clk
    );
    OneShot sh61
    (
        ly[61],
        lyr[61],
        trig_stop,
        clk
    );
    OneShot sh62
    (
        ly[62],
        lyr[62],
        trig_stop,
        clk
    );
    OneShot sh63
    (
        ly[63],
        lyr[63],
        trig_stop,
        clk
    );
    OneShot sh64
    (
        ly[64],
        lyr[64],
        trig_stop,
        clk
    );
    OneShot sh65
    (
        ly[65],
        lyr[65],
        trig_stop,
        clk
    );
    OneShot sh66
    (
        ly[66],
        lyr[66],
        trig_stop,
        clk
    );
    OneShot sh67
    (
        ly[67],
        lyr[67],
        trig_stop,
        clk
    );
    OneShot sh68
    (
        ly[68],
        lyr[68],
        trig_stop,
        clk
    );
    OneShot sh69
    (
        ly[69],
        lyr[69],
        trig_stop,
        clk
    );
    OneShot sh70
    (
        ly[70],
        lyr[70],
        trig_stop,
        clk
    );
    OneShot sh71
    (
        ly[71],
        lyr[71],
        trig_stop,
        clk
    );
    OneShot sh72
    (
        ly[72],
        lyr[72],
        trig_stop,
        clk
    );
    OneShot sh73
    (
        ly[73],
        lyr[73],
        trig_stop,
        clk
    );
    OneShot sh74
    (
        ly[74],
        lyr[74],
        trig_stop,
        clk
    );
    OneShot sh75
    (
        ly[75],
        lyr[75],
        trig_stop,
        clk
    );
    OneShot sh76
    (
        ly[76],
        lyr[76],
        trig_stop,
        clk
    );
    OneShot sh77
    (
        ly[77],
        lyr[77],
        trig_stop,
        clk
    );
    OneShot sh78
    (
        ly[78],
        lyr[78],
        trig_stop,
        clk
    );
    OneShot sh79
    (
        ly[79],
        lyr[79],
        trig_stop,
        clk
    );
    OneShot sh80
    (
        ly[80],
        lyr[80],
        trig_stop,
        clk
    );
    OneShot sh81
    (
        ly[81],
        lyr[81],
        trig_stop,
        clk
    );
    OneShot sh82
    (
        ly[82],
        lyr[82],
        trig_stop,
        clk
    );
    OneShot sh83
    (
        ly[83],
        lyr[83],
        trig_stop,
        clk
    );
    OneShot sh84
    (
        ly[84],
        lyr[84],
        trig_stop,
        clk
    );
    OneShot sh85
    (
        ly[85],
        lyr[85],
        trig_stop,
        clk
    );
    OneShot sh86
    (
        ly[86],
        lyr[86],
        trig_stop,
        clk
    );
    OneShot sh87
    (
        ly[87],
        lyr[87],
        trig_stop,
        clk
    );
    OneShot sh88
    (
        ly[88],
        lyr[88],
        trig_stop,
        clk
    );
    OneShot sh89
    (
        ly[89],
        lyr[89],
        trig_stop,
        clk
    );
    OneShot sh90
    (
        ly[90],
        lyr[90],
        trig_stop,
        clk
    );
    OneShot sh91
    (
        ly[91],
        lyr[91],
        trig_stop,
        clk
    );
    OneShot sh92
    (
        ly[92],
        lyr[92],
        trig_stop,
        clk
    );
    OneShot sh93
    (
        ly[93],
        lyr[93],
        trig_stop,
        clk
    );
    OneShot sh94
    (
        ly[94],
        lyr[94],
        trig_stop,
        clk
    );
    OneShot sh95
    (
        ly[95],
        lyr[95],
        trig_stop,
        clk
    );
    OneShot sh96
    (
        ly[96],
        lyr[96],
        trig_stop,
        clk
    );
    OneShot sh97
    (
        ly[97],
        lyr[97],
        trig_stop,
        clk
    );
    OneShot sh98
    (
        ly[98],
        lyr[98],
        trig_stop,
        clk
    );
    OneShot sh99
    (
        ly[99],
        lyr[99],
        trig_stop,
        clk
    );
    OneShot sh100
    (
        ly[100],
        lyr[100],
        trig_stop,
        clk
    );
    OneShot sh101
    (
        ly[101],
        lyr[101],
        trig_stop,
        clk
    );
    OneShot sh102
    (
        ly[102],
        lyr[102],
        trig_stop,
        clk
    );
    OneShot sh103
    (
        ly[103],
        lyr[103],
        trig_stop,
        clk
    );
    OneShot sh104
    (
        ly[104],
        lyr[104],
        trig_stop,
        clk
    );
    OneShot sh105
    (
        ly[105],
        lyr[105],
        trig_stop,
        clk
    );
    OneShot sh106
    (
        ly[106],
        lyr[106],
        trig_stop,
        clk
    );
    OneShot sh107
    (
        ly[107],
        lyr[107],
        trig_stop,
        clk
    );
    OneShot sh108
    (
        ly[108],
        lyr[108],
        trig_stop,
        clk
    );
    OneShot sh109
    (
        ly[109],
        lyr[109],
        trig_stop,
        clk
    );
    OneShot sh110
    (
        ly[110],
        lyr[110],
        trig_stop,
        clk
    );
    OneShot sh111
    (
        ly[111],
        lyr[111],
        trig_stop,
        clk
    );
endmodule
