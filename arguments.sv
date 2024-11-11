/*   arguments by name    */

module top();
int result;
	task read(integer i=0,k,data=1);
	result=i+k+data;
	$display("result = %p",result);
	endtask:read
	integer val=3;
	initial 
	begin 
	read(.i(1),.k(5),.data(7));
	read(.k(val));
	read(.k(1),.i(1));
	end
endmodule

/*   default arguments */

module top();
int result;
	task argu(int j=0,int k,int data=1);
	result=j+k+data;
	$display("result =%p",result);
	endtask:argu
	integer val=1;
	initial 
	begin 
	argu(,5);
	argu(2,val);
	argu(,5,7);
	end
endmodule

/*   arguments by value */ 
module pass_by_value_example;
  function int increment_by_value(int a);
    a = a + 1;
    return a;
  endfunction

  initial begin
    int original_value = 10;
    int result;

    result = increment_by_value(original_value);

    $display("Original Value: %0d", original_value);
    $display("Result: %0d", result);
  end
endmodule


/* arguments passing by ref    */

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
