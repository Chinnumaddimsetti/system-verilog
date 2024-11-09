module associative();
	int amem[int];
	int result;
	int index;  // Variable to store the index for first and last
	
	initial 
	begin 
		amem[2] = 1;
		amem[200] = 50;       // Changed to an integer value
		amem[30000] = "hi";    // Changed to an integer value
		amem[1] = 40;

		/* Inbuilt functions are last, first, next, prev, exist */
		if (amem.exists(200))
			$display("exist = %p", amem[200]);
		else 
			$display("not exist");

		$display("no. of entries = %p", amem.num());

		if (amem.first(index)) begin
			result = amem[index];
			$display("First entry = %p", result);
		end
		
		if (amem.last(index)) begin
			result = amem[index];
			$display("Last entry = %s", result);
		end
	end
endmodule
