// Interface for T Flip-Flop
interface tff_if(input clk);
    logic t, rst, q;
    parameter thold = 2, tsetup = 4;

    // Clocking block
    clocking cb @(posedge clk);
        default input #(tsetup) output #(thold);
        output t;
        output rst;
        input q;
    endclocking

    // Modports
    modport DUV(input t, rst, clk, output q);
    modport TEST (clocking cb, import task reset(value), import task toggle(value1));

    // Task to check functionality
    task reset(value);
        cb.rst <= value;
        cb.t <= $random;
        repeat(2) @(cb);
        if (cb.q !== 0) begin
            $display("Reset is not working");

        end else
            $display("Reset is working");
    endtask 

    task toggle(value1);
        cb.rst <= 1'b0;
        cb.t <= value1;
        repeat(2) @(cb);
        if (cb.q !==1'b1) begin
            $display("Toggle is not working");
  
        end else
            $display("Toggle is working");
    endtask
endinterface

// RTL Code for T Flip-Flop
module tff(tff_if.DUV handle);
    always @(posedge handle.clk) begin
        if (handle.rst)
            handle.q <= 1'b0;
        else if (handle.t)
            handle.q <= ~handle.q;
    end
endmodule     

// Testbench Code
module tb(tff_if.TEST handle1);
    initial begin
        @(handle1.cb);
        handle1.reset(1);
        handle1.toggle(1);
	#20;
        handle1.toggle(0);
        handle1.reset(0);
        #100 $finish;
    end
endmodule

// Top-level Module
module top();
    bit clk;
    initial clk = 0;
    always #10 clk = ~clk;

    tff_if intf(clk);
    tff RTL(intf.DUV);
    tb TB(intf.TEST);
endmodule
/*
// interface 
interface tff(input clk);
	logic t,rst,q;
	parameter thold=2,tsetup=4;
clocking cb@(posedge clk);
	default input #(tsetup) output #(thold);
	output t;
	output rst;
	input q;
endclocking
modport DUV(input t,clk,rst,output q);
modport TEST(clocking cb,import task reset,import task tgl);
	task reset;
		cb.rst<=1'b1*/
