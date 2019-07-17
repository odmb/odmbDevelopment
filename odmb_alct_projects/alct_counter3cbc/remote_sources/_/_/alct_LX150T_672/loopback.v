// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : loopback.v
// Timestamp : Fri Mar 22 16:34:02 2019

module loopback
(
    seq_cmd,
    alct_rx_1st,
    alct_rx_2nd,
    alct_tx_1st_tpat,
    alct_tx_2nd_tpat,
    alct_sync_mode,
    clock
);

    input [3:0] seq_cmd;
    input [16:5] alct_rx_1st;
    input [16:5] alct_rx_2nd;
    output [28:1] alct_tx_1st_tpat;
    output [28:1] alct_tx_2nd_tpat;
    output alct_sync_mode;
    input clock;

    wire alct_sync_teventodd;
    wire alct_sync_random_loop;
    wire alct_sync_random;
    reg [28:1] alct_tx_1st_tpat;
    reg [28:1] alct_tx_2nd_tpat;
    wire [28:1] alct_rng_1st;
    wire [28:1] alct_rng_2nd;
    wire [1:0] alct_sync_adr;
    wire [9:0] alct_rx_1st_tpat;
    wire [9:0] alct_rx_2nd_tpat;
    assign alct_sync_mode = seq_cmd[2] | seq_cmd[0];
    assign alct_sync_teventodd = seq_cmd[2] & seq_cmd[0];
    assign alct_sync_random_loop = seq_cmd[2] & (!seq_cmd[0]);
    assign alct_sync_adr = {seq_cmd[3], seq_cmd[1]};
    assign alct_sync_random = (seq_cmd[3] & seq_cmd[1]) && alct_sync_mode;
    assign alct_rx_1st_tpat[9:0] = {alct_rx_1st[16:15], alct_rx_1st[12:5]};
    assign alct_rx_2nd_tpat[9:0] = {alct_rx_2nd[16:15], alct_rx_2nd[12:5]};
    always @(posedge clock) 
    begin
        if (alct_sync_mode) 
        begin
            if (alct_sync_teventodd) 
            begin
                alct_tx_1st_tpat[28:1] = 28'd178956970;
                alct_tx_2nd_tpat[28:1] = 28'd89478485;
            end
            else if (alct_sync_random_loop) 
            begin
                alct_tx_1st_tpat[10:1] = alct_rx_1st_tpat[9:0];
                alct_tx_1st_tpat[20:11] = ~alct_rx_1st_tpat[9:0];
                alct_tx_1st_tpat[28:21] = alct_rx_1st_tpat[7:0];
                alct_tx_2nd_tpat[10:1] = alct_rx_2nd_tpat[9:0];
                alct_tx_2nd_tpat[20:11] = ~alct_rx_2nd_tpat[9:0];
                alct_tx_2nd_tpat[28:21] = alct_rx_2nd_tpat[7:0];
            end
            else 
            begin
                case (alct_sync_adr[1:0])
                    2'd0 : 
                    begin
                        alct_tx_1st_tpat[10:1] = alct_rx_1st_tpat[9:0];
                        alct_tx_2nd_tpat[10:1] = alct_rx_2nd_tpat[9:0];
                    end
                    2'd1 : 
                    begin
                        alct_tx_1st_tpat[20:11] = alct_rx_1st_tpat[9:0];
                        alct_tx_2nd_tpat[20:11] = alct_rx_2nd_tpat[9:0];
                    end
                    2'd2 : 
                    begin
                        alct_tx_1st_tpat[28:21] = alct_rx_1st_tpat[7:0];
                        alct_tx_2nd_tpat[28:21] = alct_rx_2nd_tpat[7:0];
                    end
                    2'd3 : 
                    begin
                        alct_tx_1st_tpat[28:1] = alct_rng_1st[28:1];
                        alct_tx_2nd_tpat[28:1] = alct_rng_2nd[28:1];
                    end
                endcase
            end
        end
    end
endmodule
