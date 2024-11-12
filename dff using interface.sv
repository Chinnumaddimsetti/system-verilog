`timescale 10ns/1ns

// DFF interface
interface dff_if(input clk);	
	logic d0, d1, sel, rst, q;
	parameter thold = 2, tsetup = 4;

	// Clocking block
	clocking cb @(posedge clk);
		default input #(tsetup) output #(thold);
		output d0;
		output d1;
		output rst;
		output sel;
		input q;
	endclocking

	// Modports
	modport DUV (input d0, d1, rst, sel, clk, output q);
	
	// Task for checking reset
	task reset;
		cb.rst <= 1'b1;
		cb.sel <= $random;
		cb.d0 <= 1'b1;
		cb.d1 <= 1'b1;
		repeat(2) @(cb);
		if (cb.q !== 0) begin 
			$display("Reset is not working");
			$stop;
		end else
			$display("Reset is working");
	endtask
	
	// Task for d0
	task ipd0;
		cb.rst <= 1'b0;
		cb.sel <= 1'b0;
		cb.d0 <= 1'b1;
		cb.d1 <= ~1'b0;
		repeat(2) @(cb);
		if (cb.q !== 1'b1) begin
			$display("Load d0 is not working");
			$stop;
		end else	
			$display("Load d0 is working");
	endtask
	
	// Task for d1
	task ipd1;
		cb.rst <= 1'b0;
		cb.sel <= 1'b1;
		cb.d0 <= ~1'b1;
		cb.d1 <= 1'b1;
		repeat(2) @(cb);
		if (cb.q !== 1'b1) begin
			$display("Load d1 is not working");
			$stop;
		end else	
			$display("Load d1 is working");
	endtask
			
	modport TEST (clocking cb, import task reset(), import task ipd0(), import task ipd1());
endinterface

// D Flip-Flop module
module dff(dff_if.DUV dff_if);
	always_ff @(posedge dff_if.clk or posedge dff_if.rst) begin
		if (dff_if.rst) 
			dff_if.q <= 1'b0;  // Reset output to 0
		else if (dff_if.sel)
			dff_if.q <= dff_if.d1; // Load d1 if sel is high
		else
			dff_if.q <= dff_if.d0; // Load d0 if sel is low
	end
endmodule

// Testcase module
module testcase(dff_if.TEST test_if);
	initial begin 
		@(test_if.cb);
		test_if.reset;
		test_if.ipd0;
		test_if.ipd1;
		test_if.ipd0;
		test_if.ipd1;
		#10 $finish;
	end 
endmodule

// Top module
module top();
	bit clk;
	initial clk = 0;
	always #10 clk = ~clk;
	
	dff_if IF (clk);
	dff RTL (IF);
	testcase TB (IF);
endmodule
