/*                              lab -2 assignments                                */
//                            snippet -1                         
/*
module test();
	int d,result;
	int a=2,b=3;
	function automatic mult(input int a,input int b,output int c);
		c=(a*b)+2;
		$display("inside function t=%t,a=%d,b=%d,c=%d",$time,a,b,c);
		// t=1 a=2 b=3 c=8
		// t=5 a=2 b=4 c=10
	endfunction
	initial 
		fork 
			begin 
				#1;
				mult(2,3,d);
				$display("begin 1: t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=1 a=2 b=3 c=8
			end
			begin 
				#5;
				mult(2,4,d);
				$display("begin 2: t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=5 a=2 b=3 c=10
			end
		join 
endmodule
*/
//                           snippet-2
/*
module test();
	int d,result;
	int a=2 ,b=3;
	function automatic mult(ref int a,ref int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside fun t=%t,a=%d,b=%d,c=%d",$time,a,b,c);
		// t=1 a=3 b=3 c=8
		// t=2 a=4 b=3 c=11
	endfunction
	initial 
		fork 
			begin 
			#1;
			mult(a,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=1 a=3 b=3 c=8
			end
			begin 
			#2;
			mult(a,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=2 a=4 b=3 c=11
			end
			
		join
	endmodule
*/
//                                 snippet -3
/*
module test();
	int d,result;
	int a=2 ,b=3;
	function mult(input int a,input int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside fun t=%t,a=%d,b=%d,c=%d",$time,a,b,c);
		// t=1 a=6 b=3 c=17
		// t=2 a=3 b=3 c=8
	endfunction
	initial 
		fork 
			begin 
			#1;
			mult(5,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=1 a=2 b=3 c=17
			end
			begin 
			#2;
			mult(a,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=2 a=2 b=3 c=8
			end
			
		join
	endmodule
*/
//                        snippet-4

module test();
	int d,result;
	int a=2 ,b=3;
	task automatic mult(input int a,input int b,output int c);
		#5; 
		c=(a*b)+2;
		a++;
		$display("inside fun t=%t,a=%d,b=%d,c=%d",$time,a,b,c);
		// t=6 a=3 b=3 c=8
		// t=7 a=3 b=3 c=8
	endtask
	initial 
		fork 
			begin 
			#1;
			mult(a,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=6 a=2 b=3 c=8
			end
			begin 
			#2;
			mult(a,b,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=7 a=2 b=3 c=8
			end
			
		join
	endmodule

//                   snippet-5
/*
module test();
	int d,result;
	int a=2 ,b=3;
	function automatic mult(input int a,input int b,output int c); 
		c=(a*b)+2;
		a++;
		$display("inside fun t=%t,a=%d,b=%d,c=%d",$time,a,b,c);
		// t=1 a=3 b=3 c=8
		// t=2 a=3 b=4 c=10
	endfunction
	initial 
		fork 
			begin 
			#1;
			mult(2,3,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=1 a=2 b=3 c=8
			end
			begin 
			#2;
			mult(2,4,d);
			$display("outside fun t=%t,a=%d,b=%d,d=%d",$time,a,b,d); // t=2 a=2 b=3 c=10
			end
			
		join
	endmodule
*/	
//                          snippet -6
/*
class pass_by_ref;
	int refr=2;
	int val=2;
	function automatic int check_refer(ref int r);
		$display("initial value of refr=%d",r);  //2
		r++;
		$display("value of refr after incrementing %d",r);  //3
	endfunction
	function int check_val(int v);
		$display("initial value of val %d",v); //2
		v++;
		$display("value of val after incrementing %d",v);  //3
	endfunction
endclass
pass_by_ref h1;
module test;
	initial
		begin 
			h1=new();
			h1.check_refer(h1.refr);
			h1.check_val(h1.val);
			$display("value of refr after incrementing%d",h1.refr);  //3
			$display("value of val after incrementing %d",h1.val);  //2
		end
endmodule
*/
//                   snippet-7
/*
module test();
	task dummy(input int x,string str);
		fork
			begin 
				#x;
			end
			begin 
				#10;
			end
		join_any
		disable fork;
		$display("%s is disabled at t=%t",str,$time);
	endtask
	initial 
		fork 
			begin 
				#2;
				dummy(5,"call_1");
			end
			begin 
				#1;
				dummy(15,"call_2");
			end
		join
endmodule
*/
/* results of snippet-7 
    t=7 call_1
	t=11 call_1
*/
