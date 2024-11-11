module test();
	int ma=20;
	function void value(int fa);
		fa=fa*2;
		$display("inside the value of function by value = %d",fa);
	endfunction
	function automatic void refs(ref int fa);
		fa=fa*2;
		$display("inside the ref =%d",fa);
	endfunction
	initial 
		begin 	
		 value(ma);
		 $display("value of ma after value function =%d",ma);
		 refs(ma);
		 $display("value of ma after refs function =%d",ma);
		end
endmodule
