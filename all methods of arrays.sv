module top();
	int da1[]; 
	int q[$];
	int result;
	initial 
	begin 
	da1=new[10];
	foreach(da1[i])
	da1[i]={$random}%20;
	$display("%p",da1);
	//methods
	da1.reverse();
	$display("reversed array %p",da1);
	da1.sort();
	$display("sorted array %p",da1);
	da1.rsort();
	$display("rsorted array %p",da1);
	da1.shuffle();
	$display("shuffled array %p",da1);
	result=da1.sum();
	$display("sum of array %p",result);
	result=da1.and();
	$display("and of array %p",result);
	result=da1.product with(int'(item>7));
	$display("product of array",result);
	result=da1.xor();
	$display("xor of array %p",result);
#we must use queues fir memory locator methods and find statements requires clause with        
        q=da1.min();
	$display("min value of array %p",q);
	q=da1.find_first with(item>10);
	$display("find ele of array %p",q);

	end
endmodule
	
