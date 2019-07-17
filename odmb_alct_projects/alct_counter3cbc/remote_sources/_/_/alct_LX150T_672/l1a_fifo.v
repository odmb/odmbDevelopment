// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : l1a_fifo.v
// Timestamp : Fri Mar 22 16:34:02 2019

module l1a_fifo
(
    din,
    dout,
    wen,
    ren,
    reset,
    empty,
    full,
    clk
);

    input [29:0] din;
    output [29:0] dout;
    input wen;
    input ren;
    input reset;
    output empty;
    reg    empty;
    output full;
    reg    full;
    input clk;

    reg [29:0] mem [255:0];
    // synthesis attribute ram_style of mem is block
    reg [7:0] waddr;
    reg [7:0] raddr;
    reg [7:0] raddrr;
    always @(posedge clk) 
    begin
        if (wen && (!full)) 
        begin
            mem[waddr] = din;
            waddr = waddr + 1;
        end
        if (ren && (!empty)) 
        begin
            raddrr = raddr;
            raddr = raddr + 1;
        end
        if (reset) 
        begin
            waddr = 0;
            raddr = 0;
        end
        full = (waddr + 1) == raddr;
        empty = waddr == raddr;
    end
    assign dout = mem[raddrr];
endmodule
