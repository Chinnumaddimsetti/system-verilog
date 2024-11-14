	
class pass_by_ref;
	int refr=2;
	int val=2;
	function automatic int check_refer(ref int r);
		$display("\n ---------- pass by reference --------------\n");
		$display("initial value of refr=%d",r);
		r++;
		$display("value of refr after incrementing %d",r);
	endfunction
	function int check_val(int v);
		$display("\n ---------- pass by  value --------------\n");
		$display("initial value of val=%d",r);
		r++;
		$display("value of val after incrementing %d",v);
	endfunction
endclass
pass_by_ref h1;
module test;
	initial 
		begin 
			h1=new();
			h1.check_refer(h1.refr);
			h1.check_val(h1.val);
			$display("\n ---------- in memory --------------\n");
			$display(" value of refr after increment=%d",h1.refr);
			$display("value of val after incrementing %d",h1.val);
		end
endmodule