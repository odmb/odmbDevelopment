// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : best_delay.v
// Timestamp : Fri Mar 22 16:34:02 2019

module best_delay
(
    din,
    dout,
    delay,
    we,
    l1a,
    l1a_window,
    valid,
    valorr,
    trig_stop,
    clk
);

    input [33:0] din;
    output [33:0] dout;
    input [7:0] delay;
    input we;
    input l1a;
    input [3:0] l1a_window;
    input valid;
    output valorr;
    reg    valorr;
    input trig_stop;
    input clk;

    reg [33:0] mem [255:0];
    // synthesis attribute ram_style of mem is block
    reg [255:0] val;
    // synthesis attribute ram_style of val is distributed
    reg [7:0] adw;
    reg [7:0] adr;
    reg [7:0] adrr;
    reg [7:0] advr;
    reg valout;
    reg [15:0] val_sh;
initial val = 0;
initial adw = 0;
initial adr = 0;
    reg valor;
    always @(posedge clk) 
    begin
        if (trig_stop) 
        begin
            val = 255'h0;
            adw = 0;
            adr = (adw - delay) + 1;
        end
        else 
        begin
            valorr = valor;
            if (we) mem[adw] = din;
            adrr = adr;
            adr = (adw - delay) + 1;
            valout = val[advr];
            if (we) val[adw] = valid;
            advr = (((adw - delay) + 16) + 1) + 1;
            adw = adw + 1;
            case (l1a_window)
                1 : 
                begin
                    valor = val_sh[0];
                end
                2 : 
                begin
                    valor = |val_sh[1:0];
                end
                3 : 
                begin
                    valor = |val_sh[2:0];
                end
                4 : 
                begin
                    valor = |val_sh[3:0];
                end
                5 : 
                begin
                    valor = |val_sh[4:0];
                end
                6 : 
                begin
                    valor = |val_sh[5:0];
                end
                7 : 
                begin
                    valor = |val_sh[6:0];
                end
                8 : 
                begin
                    valor = |val_sh[7:0];
                end
                9 : 
                begin
                    valor = |val_sh[8:0];
                end
                10 : 
                begin
                    valor = |val_sh[9:0];
                end
                11 : 
                begin
                    valor = |val_sh[10:0];
                end
                12 : 
                begin
                    valor = |val_sh[11:0];
                end
                13 : 
                begin
                    valor = |val_sh[12:0];
                end
                14 : 
                begin
                    valor = |val_sh[13:0];
                end
                15 : 
                begin
                    valor = |val_sh[14:0];
                end
                default : 
                begin
                    valor = |val_sh[9:0];
                end
            endcase
            val_sh = {valout, val_sh[15:1]};
        end
    end
    assign dout = mem[adrr];
endmodule
