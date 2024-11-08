module test_array();

	// Declare a dynamic array data_da of int data type
		int data_da[];
		
	// Declare queues data_q & addr_q of int data type
		int data_q[$];int addr_q[$];



	// Declare associative array data_mem of int data type and indexed with bit[7:0]
		int data_mem[bit[7:0]];

	
	// Declare int variable result,and and an 8 bit variable idx
               bit [7:0]idx;
		int result;
	

	initial
		begin
	
			// Allocate 10 memory locations for dynamic array & initialize
			// all the locations with some random values less than 20 & display the array
	
			data_da=new[10];
			foreach(data_da[i])
				data_da[i]={$random}%20;
				$display("array is %p",data_da);
				
			
			// Call the array reduction method sum which returns the sum
			// of all elements of array and collect the return value to the variable result
				result=data_da.sum();
                                $display("sum of array is %d",result);
			
			
			// Display the sum of elements, result
			
	
			// Similarly explore other array reduction methods 
			// product,or,and & xor
	                       $display("and = %p,product=%p,xor=%p",data_da.and(),data_da.product(),data_da.xor());
	
			// Call the array reduction method sum with "with" clause which returns 
			// total number of elements satisfying the condition within the "with" clause 

			result = data_da.sum with (int'(item>7));
			
			// Display the value of the result
			
			$display(" no. of items greater than 7 = %0d", result);
			
			// Similarly explore other array reduction methods with "with"clause
			result =data_da.and with(int'(item>7));
			$display("value of and = %p",result);
			result =data_da.product with(int'(item>7));
			$display("value of product = %p",result);
			result =data_da.xor with(int'(item>7)); 
			$display("value of xor = %p",result);
		
			
	
			// Sorting Methods
	
			// call all the sorting methods like reverse, sort, rsort & 
			// shuffle & display the array after execution of each method to 
			// understand the behaviour of the array methods
			data_da.reverse();
			$display("reverse of array = %p",data_da);
			data_da.sort();
			$display("sort of array = %p",data_da);
			data_da.rsort();
			$display("rsort of array = %p",data_da);
			data_da.shuffle();
			$display("shuffled of an array = %p",data_da);
			
	
			// Call Array locator methods like min, max, unique,find_* with,
			// find_*_index with using dynamic array & display 
			// the contents of data_q after execution of each method to 
			// understand the behaviour of the array methods
			data_q=data_da.min();
			$display("minimum number is %p",data_q); 
			data_q=data_da.max();
			$display("maximum number is %p",data_q); 
			data_q=data_da.unique();
			$display("unique number is %p",data_q); 
			data_q=data_da.find_first with (item>5);
			$display("first number is %p",data_q); 
			data_q=data_da.find_first_index with (item>5);
			$display("first index number is  %p",data_q);
			data_q=data_da.find_last with (item>7);
			$display("last number is ",data_q);  
			data_q=data_da.find_last_index with (item>7);
			$display("last index number is %p",result); 


			
			
			//Generate some 10 random address less than 100 within a repeat loop 
			//push the address in to the addr_q
			repeat(10)
			begin
				result={$random}%100;
				addr_q.push_back(result);
			end

			
			//Display the addr_q
			$display("random addresses :%p\n",addr_q);
			
			
			
			// With in for loop update the associate array with random data less than 200
			// based on the address stored in addr_q
			// Hint: To get the address use pop method 
			for(int i=0;i<10;i++)
			begin
				data_mem[addr_q.pop_front]={$random}%200;
			end

			
			// Display the contents of associate array using foreach loop
			foreach(data_mem[i])
			$display("value of array",data_mem[i]);
			
			// Display the first index of the array by using associative array method first
			if(data_mem.first(idx))
			$display("Data in memory :%d" ,idx);

			// Display the first element of the array
			$display("Data in first element is :%d", data_mem[idx]);	
			// Display the last index of the array by using associative array method last
			if(data_mem.last(idx))
			$display("Data in memory :%d" ,idx);

			
			// Display the last element of the array
			$display("Data in last element is :%d", data_mem[idx]);	
				
		end
	
endmodule	
	
	
