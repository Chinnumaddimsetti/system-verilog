module top();
	task double(int a,string s);
	#5 ;
	a=a*2;
	$display($time,"s=%s,a=%d",s,a);
	endtask 
	initial 
	fork
		begin 
		double(5,"thread 1:");
		end
		begin 
		#2;
		double(2,"thread 2:");
		end
	join
endmodule

module top();
	task automatic double1(int a,string s);
	#5;
	a=a*2;
	$display($time,"s=%s,a=%d",s,a);
	endtask 
	initial 
	fork
		begin
		double1(5,"thread 1:");
		end
		begin
		#2; 
		double1(2,"thread 2:");
		end
	join
endmodule