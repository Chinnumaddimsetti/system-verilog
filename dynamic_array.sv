module dynamic_array();
	int da1[],da2[];
	int value;
	initial 
		begin 
			da1=new[10];
			foreach(da1[i])
			da1[i]={$random}%20;
			$display("array =%p",da1);
			da2=da1                 //copying
			da1=new[100]da1;        // allocate 100 memory and copying values
			da1=new[12];           // allocate new memory loses old data
                        value=da2.size();
			$display("array= %p",value);
                        da2.delete();
		end

endmodule			