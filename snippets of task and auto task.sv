//                                snippet -1

/*module test();
	int d,result;
	int a=2,b=6;
	task  automatic mult (input int a,input int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside function t=%t,a=%d,b=%d,c=%d",$time,a,b,c); // 1s a=3 ,b=3 c=8  2s a=3,b=4,c=10
	endtask
	initial 
		fork 
			begin 
				#1;
					mult(2,3,d);
					$display("outside begin 1 t=%t,a=%d,b=%d,c=%d",$time,a,b,d); // 1s a=2 b=3 d=8
			end
			begin 
				#2;
					mult(2,4,d);
					$display("outsdie  begin 2 t=%t,a=%d,b=%d,c=%d",$time,a,b,d);// 2s a=2 b=6 d=10
			end
		join
endmodule
*/
//                            snippet -2
/*
module test();
	int d,result;
	int a=2,b=6;
	task  automatic mult (ref int a,ref int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside function t=%t,a=%d,b=%d,c=%d",$time,a,b,c); // 1s a=3 ,b=3 c=14  2s a=4,b=6,c=20
	endtask
	initial 
		fork 
			begin 
				#1;
					mult(a,b,d);
					$display("outside begin 1 t=%t,a=%d,b=%d,c=%d",$time,a,b,d); // 1s a=3 b=3 d=14
			end
			begin 
				#2;
					mult(a,b,d);
					$display("outsdie  begin 2 t=%t,a=%d,b=   %d,c=%d",$time,a,b,d);// 2s a=4 b=6 d=20
			end
		join
endmodule
*/
/*module test();
	int d,result;
	int a=2,b=6;
	task mult (input int a,input int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside function t=%t,a=%d,b=%d,c=%d",$time,a,b,c); // 1s a=3 ,b=3 c=14  2s a=4,b=6,c=20
	endtask
	initial 
		fork 
			begin 
				#1;
					mult(4,5,d);
					$display("outside begin 1 t=%t,a=%d,b=%d,c=%d",$time,a,b,d); // 1s a=3 b=3 d=14
			end
			begin 
				#2;
					mult(5,6,d);
					$display("outsdie  begin 2 t=%t,a=%d,b=%d,c=%d",$time,a,b,d);// 2s a=4 b=6 d=20
			end
		join
endmodule
*/
//                     snippet -5  
/*module test();
	int d,result;
	int a=2,b=6;
	task   mult ( int a,int b,output int c);
		c=(a*b)+2;
		a++;
		$display("inside function t=%t,a=%d,b=%d,c=%d",$time,a,b,c); // 1s a=3 ,b=3 c=14  2s a=4,b=6,c=20
	endtask
	initial 
		fork 
			begin 
				#1;
					mult(a,b,d);
					$display("outside begin 1 t=%t,a=%d,b=%d,c=%d",$time,a,b,d); // 1s a=3 b=3 d=14
			end
			begin 
				#2;
					mult(5,b,d);
					$display("outsdie  begin 2 t=%t,a=%d,b=   %d,c=%d",$time,a,b,d);// 2s a=4 b=6 d=20
			end
		join
endmodule*/
//                       snippet-6
/*
module main();
	int d,result;
	int a=2,b=2;
	task automatic mult(input int a,input int b,output int c);
		#5;
		c=(a**b)+2;
		a++;
		$display(" inside t=%t,a=%d,b=%d,c=%d",$time,a,b,c);// a=3 b=3 c=10
	endtask
	initial
		fork 
		begin 
			#1;
			mult(2,3,d);
			$display("outside t=%t,a=%d,b=%d,c=%d",$time,a,b,d);// a=2 b=3 d=10
		end
		join
endmodule
*/
//                                                 snippet-7

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
		#2; dummy(5,"call_1");
		end	
		begin 
		#1;
		 dummy(15,"call_2");
		end
		join
endmodule
*/
	
