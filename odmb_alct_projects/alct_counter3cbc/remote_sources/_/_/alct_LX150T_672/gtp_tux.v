// This  Verilog HDL  source  file was  automatically generated
// by C++ model based on VPP library. Modification of this file
// is possible, but if you want to keep it in sync with the C++
// model,  please  modify  the model and re-generate this file.
// VPP library web-page: http://www.phys.ufl.edu/~madorsky/vpp/

// Author    : hvuser
// File name : gtp_tux.v
// Timestamp : Fri Mar 22 16:34:02 2019

module gtp_tux
(
    daqo,
    clk,
    tx_p,
    tx_n,
    refclk_p,
    refclk_n,
    reset
);

    input [18:0] daqo;
    input clk;
    output [1:0] tx_p;
    output [1:0] tx_n;
    input refclk_p;
    input refclk_n;
    input reset;

	optical_lx150t gtp
	(
		.clock    (clk),
		.daq_word (daqo),
		.tx_p     (tx_p),
		.tx_n     (tx_n),
		.refclk_p (refclk_p),
		.refclk_n (refclk_n),
		.reset_i  (reset)
	);
endmodule
