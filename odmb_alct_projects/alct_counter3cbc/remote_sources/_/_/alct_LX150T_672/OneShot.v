module OneShot(ly, lyr, trig_stop, clk);

    input ly;
    output lyr;
	input  trig_stop;
    input  clk;

    wire   lyd;
    wire   lys, sri;

    SRL16 sr (.Q(lys), .A0(1'b1), .A1(1'b0), .A2(1'b1), .A3(1'b0), .CLK(clk), .D(sri));
    FDRE flop (.Q(lyr), .C(clk), .CE(sri), .D(1'b1), .R(lys | trig_stop));
    FDR iflop (.Q(lyd), .C(clk), .D(ly), .R(trig_stop));

    assign sri = ly & !lyd;

endmodule
