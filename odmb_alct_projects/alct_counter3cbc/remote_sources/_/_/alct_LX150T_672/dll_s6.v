// DLL component. Includes the reset counter.
module dll 
(
	clkin,
	c_40_0,
	c_40_90,
    c_40_270,
	c_80_0,
	c_80_90,
	c_40_0_nob,
	locked
);
	input clkin;
	output		
		c_40_0,
		c_40_90,
		c_40_270,		
		c_80_0,
		c_80_90,
		c_40_0_nob,
		locked;
		
    reg [24:0] resetcnt = 25'h1fffff8;


//----------------------------------------------------------------------------
// Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
// Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1    40.000      0.000      50.0      312.078    259.584
// CLK_OUT2    40.000     90.000      50.0      312.078    259.584
// CLK_OUT3    80.000      0.000      50.0      268.445    259.584
// CLK_OUT4    80.000     90.000      50.0      268.445    259.584
// CLK_OUT5    40.000    270.000      50.0      312.078    259.584
//
//----------------------------------------------------------------------------
// Input Clock   Input Freq (MHz)   Input Jitter (UI)
//----------------------------------------------------------------------------
// primary              40            0.010


//  dll_2x dll
  dll_2019 dll
   (// Clock in ports
    .CLK_IN1(clkin),      // IN
    // Clock out ports
    .CLK_OUT1(c_40_0),     // OUT
    .CLK_OUT2(c_40_90),     // OUT
    .CLK_OUT3(c_80_0),     // OUT
    .CLK_OUT4(c_80_90),     // OUT
    .CLK_OUT5(c_40_270),     // OUT
    .CLK_OUT6(c_40_270_nob),     // OUT
    // Status and control signals

    .RESET(resetcnt[24]),// IN
    .LOCKED(locked)
	);      // OUT


	
	FDRSE #(.INIT(1'b0)) ulac 
	(
	 .Q	(c_40_0_nob),		// Data output
	 .C	(c_80_0),			// Clock input
	 .CE(1'b1),		// Clock enable input
	 .D	(c_40_270_nob),	// Data input
	 .R	(1'b0),				// Synchronous reset input
	 .S	(1'b0)				// Synchronous set input
    );
	
    always @(posedge clkin)
    begin
	    resetcnt <= (locked == 1) ? 0 : resetcnt + 1;
    end

endmodule
