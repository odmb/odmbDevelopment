// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : l1a_maker_.v
// Timestamp : Fri Mar 22 16:34:02 2019

module l1a_maker_
(
    l1a_in,
    valor,
    track,
    l1a_outp,
    best_wnd,
    raw_wnd,
    l1a_fifo_full,
    best_full,
    raw_full,
    raw_we_en,
    best_we,
    raw_we,
    l1a_int_en,
    l1a_in_count,
    l1a_offset,
    send_empty,
    reset,
    clk
);

    input l1a_in;
    input valor;
    input track;
    output l1a_outp;
    input [3:0] best_wnd;
    input [4:0] raw_wnd;
    input l1a_fifo_full;
    input best_full;
    input raw_full;
    input raw_we_en;
    output best_we;
    reg    best_we;
    output raw_we;
    reg    raw_we;
    input l1a_int_en;
    output [11:0] l1a_in_count;
    reg    [11:0] l1a_in_count;
    input [3:0] l1a_offset;
    input send_empty;
    input reset;
    input clk;

    reg l1ar;
    reg [3:0] best_cnt;
    reg [4:0] raw_cnt;
    wire l1a_out;
    assign l1a_out = l1a_in && (!l1ar);
    assign l1a_outp = ((((l1a_out || (track && l1a_int_en)) && (!best_full)) && (!raw_full)) && (!l1a_fifo_full)) && (valor || send_empty);
    always @(posedge clk) 
    begin
        if (!reset) 
        begin
            l1a_in_count = l1a_offset;
            l1a_in_count = l1a_in_count - 12'd1;
        end
        else 
        begin
            l1ar = l1a_in;
            if (best_we) 
            begin
                if (best_cnt < best_wnd) best_cnt = best_cnt + 1;
                else best_we = 0;
            end
            if (raw_we) 
            begin
                if (raw_cnt < raw_wnd) raw_cnt = raw_cnt + 1;
                else raw_we = 0;
            end
            if (l1a_outp && (!best_full)) 
            begin
                best_we = 1;
                best_cnt = 1;
            end
            if ((l1a_outp && (!raw_full)) && raw_we_en) 
            begin
                raw_we = 1;
                raw_cnt = 1;
            end
            if (l1a_in) l1a_in_count = l1a_in_count + 12'd1;
        end
    end
endmodule
