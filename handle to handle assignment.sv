/* in this same data is pointed to both handles */ 
module test_obj_assignment;
	class packet;
		bit [3:0]data;
		bit [15:0]addr;
		bit [15:0]mem;
	endclass:packet
	packet pkt_h1;packet pkt_h2;
	packet pkt1;packet pkt2;
	initial 
		begin 
		pkt1=new;
		pkt1.data=10;
		pkt1.addr=20;
		pkt1.mem=15;
		$display("pkt1=%d",pkt1);
		pkt2= new pkt1;
		$display("pkt1.data =%d,pkt1.addr=%d,pkt1.mem=%d",pkt1.data,pkt1.addr,pkt1.mem);
		$display("pkt1=%d,pkt2=%d",pkt1,pkt2);
		pkt2.data=20;
		pkt2.mem=9;
		$display("pkt2.data=%d,pkt2.mem",pkt2.data,pkt2.mem);
		$display("pkt1=%d,pkt2=%d",pkt1,pkt2);
			$display("pkt1.data =%d,pkt1.addr=%d,pkt1.mem=%d",pkt1.data,pkt1.addr,pkt1.mem);
			$display("pkt2.data =%d,pkt2.addr=%d,pkt2.mem=%d",pkt2.data,pkt2.addr,pkt2.mem);
		end
endmodule