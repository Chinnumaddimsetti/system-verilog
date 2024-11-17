/*    snippet-1   */

class base;
	static int i;
	static function static get();
		int a;
		a++;
		i++;
		$display(a);
		$display(i);
	endfunction 
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get(); 
			h1.get();
			h2.get();
		end
endmodule
/* output :- 1
			 1
			 2
			 2
			 3
			 3
	inside the class "i" is static and as get is static inside of get is also static
*/
/*     snippet-2     */
/*
class base;
	static function static get();
		int a;
		a++;
		$display(a);
	endfunction 
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/
/* output :- 1
			 2
			 3
	a is static as it is present inside the static get method. only static property will increment inside the static function 
*/
/*       snippet-3     */
/*
class base;
	int i;
	static function get();
		static int a;
		a++;
		$display(a);
	endfunction 
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/
/* output :-1
			2
			3
if we didn't mention static before function or explictly before the variable as "a" it will automatic in nature 
variable i can't me accessed inside the static function
*/ 
/*       snippet-4    */
/*
class base;
	int i;
	static function get();
		int a;
		a++;
		$display(a);
	endfunction 
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/
/* result :- 1
			 1
			 1
nature of a is automatic  as a is not mentioned as static so new memory will be allocated when called
*/
/*      snippet-5       */
/*
class base;
	int i;
	static function get();
		int a;
		a++;
		i++;
		$display(a);
		$display(i);
	endfunction 
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/
/* output :- ERROR
without creating an object we can't access the class variable(i). here "i" is dynamic in nature   
output if i is static :- 
							1
							1
							1
							2
							1
							3
because a is non static in nature so nature is automatic(no incrementing)
*/
/*            snippet-6    */
/* 
class base;
	static int i;
	static function get();
		int a;
		a++;
		i++;
		$display(a);
		$display(i);
    endfunction
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
        end
endmodule
*/
/*
output :-  1
		   1
		   1
		   2
		   1
		   3
here a is automatic and i is static 
*/
/*                  snippet -7      */

/* 
class base;
	static int i;
	function static get();
		int a;
		a++;
		i++;
		$display(a);
		$display(i);
	endfunction
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/
/* output:- 1
			1
			2
			2
			3
			3
here function is not static but method inside the function is static 
it means the variable inside the methods are all are static
*/
/*              snippet-8             */
/*
class base;
	 int i;
	function static get();
		int a;
		a++;
		i++;
		$display(a);
		$display(i);
	endfunction
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1.get();
			h1.get();
			h2.get();
		end
endmodule
*/

/*  output:- ERROR 
because variable "i" is dynamic in nature to acces that in function we must create object it throughs error 


*/
/*                   snippet -9           */

/* 
class base;
	 int i;
  	function new();
        i = 0; // Initialize dynamic variable
    endfunction
	function static get();
		int a;
		a++;
      	i++;
      $display(i);
		$display(a);
    endfunction
endclass
base h1,h2;
module test();
	initial 
		begin 
			h1=new();
			h2=new();
			h1.get();
			h1.get();
			h2.get();
        end
endmodule
*/
/* output :-  1
			1
			2
			2
			1
			3
Doubt about object creation
*/
/*                  snippet -10         */
/*
class trans;
	int i;
	function new();
		i=10;
	endfunction
endclass
class ex extends trans;
	int i;
	function new(int i);
		this,i=i;
	endfunction
endclass
ex h1;
module abc();
	initial 
		begin 
			h1=new(10);
			$display("%p",h1);
		end
endmodule
*/
/* output :- error because parent class function is not expexting any arguments 

*/

/*        snippet -11      */
/* 
class trans;
	int i;
	function new(int i);
		this.i=i;
	endfunction 
endclass 
class ex extends trans;
	int i;
	function new(int i);
		super.new(i);
		this.i=20;
	endfunction 
endclass
ex h1;
module abc();
	initial 
		begin 
			h1=new(10);
			$display("%p",h1);
		end
endmodule
*/
/* output :- '{[trans]:'{i:10}, i:20}
super refers to parent variable 
this refers to present class variable

*/
/*                snippet -12         */
/*
class trans;
	int i;
	function new(int i=10);
		this.i=i;
	endfunction 
endclass 
class ex extends trans;
	int i;
	function new();
		i=20;
	endfunction 
endclass
ex h1;
module abc();
	initial 
		begin 
			h1=new();
			$display("%p",h1);
		end
endmodule
/*
/* output :- '{[trans]:'{i:10}, i:20}
here parent function have default value and class have no argument. if we are not calling super.new on child class 
by default the class const make a call to parent constuctor.
*/
/*          snippet -13          */
/* 

class trans;
	int i;
	function new(int i=10);
		i=10;
	endfunction 
endclass 
class ex extends trans;
	int i;
	function new();
		i=20;
	endfunction 
endclass
ex h1;
module abc();
	initial 
		begin 
			h1=new();
			$display("%p",h1);
		end
endmodule
*/
/* output :- '{[trans]:'{i:0}, i:20}
here child constuctor is called without arguments as we are not using 
any super keyword class constuctor defaulty calls the parent constructor
in child "i" indicate to it's own variable but in parent doesn't refers to its own variable 
so parent "i" default value is "0".if assign 10 to parent use "this" keyword.
*/
/*              snippet -14       */
/*
class trans;
	int i;
	function new();
		i=10;
	endfunction 
endclass 
class ex extends trans;
	int i;
	function new();
		i=20;
	endfunction 
endclass
ex h1;
module abc();
	initial 
		begin 
			h1=new();
			$display("%p",h1);
		end
endmodule
*/

/*  output :-'{[trans]:'{i:10}, i:20}
 same as above 

*/
/*               snippet -15          */
/*
class trans;
	virtual task send();
		$display("IN class trans");
	endtask
endclass
class ex extends trans;
	virtual task send();
		$display("IN the ex");
	endtask
endclass
class ex1 extends ex;
	task send();
		$display("IN the class ex1");
	endtask
endclass
trans t1;
ex e1;
ex1 e2;
module inheritance;
	initial 
		begin 
			e1=new();
			e2=new();
			t1=e2;
			t1.send();
		end
endmodule
*/
/* output:- IN the class ex1

Virtual Methods:-
A virtual method is a method in a base class that can be overridden in derived classes.
It can have a default implementation in the base class, which the derived class may or may not override.
If the derived class does not override the method, the base class implementation is used.

pure virtual methods:-
A pure virtual method is a method in a base class that is declared but not implemented.
It must be overridden in the derived class, making it a requirement.
Declared using the = 0 syntax at the end of the method declaration.
The base class becomes an abstract class if it contains at least one pure virtual method, meaning you cannot instantiate it directly.
*/

/*                     snippet-16     */
/*
class trans;
	virtual task send();
		$display("IN class trans");
	endtask
endclass
class ex extends trans;
	virtual task send();
		$display("IN the ex");
	endtask
endclass
class ex1 extends ex;
	task send();
		$display("IN the class ex1");
	endtask
endclass
trans t1;
ex e1;
ex1 e2;
module inheritance;
	initial 
		begin 
			e1=new();
			e2=new();
			t1=e1;
			e1=e2;
			t1.send();
		end
endmodule
*/
/* output :- IN the ex
neglect the statement below the assignment of parent to grand parent
*/

/*                  snippet-17                       */
/*
class trans;
	virtual task send();
		$display("IN class trans");
	endtask
endclass
class ex extends trans;
	virtual task send();
		$display("IN the ex");
	endtask
endclass
class ex1 extends ex;
	task send();
		$display("IN the class ex1");
	endtask
endclass
trans t1;
ex e1;
ex1 e2;
module inheritance;
	initial 
		begin 
			e1=new();
			e2=new();
			e1=e2;
			t1.send();
		end
endmodule
*/
/* output:- " ERROR "
here the grand parent handle is pointed to null 
so the output is null
*/

/*                snippet-18            */
/*
class trans;
	virtual task send();
		$display("IN class trans");
	endtask
endclass
class ex extends trans;
	virtual task send();
		$display("IN the ex");
	endtask
endclass
class ex1 extends ex;
	task send();
		$display("IN the class ex1");
	endtask
endclass
trans t1;
ex e1;
ex1 e2;
module inheritance;
	initial 
		begin 
			e1=new();
			t1=e1;
			t1.send();
		end
endmodule
*/
/* output:-  IN the ex
*/
/*                  snippet- 19                  */
/*
class AB;
	int i=1;
endclass
AB a1;
module test();
	initial 
		begin 
		repeat(2)
		begin 
			AB a2=new();
			a1=new();
			a1.i++;
			a2.i++;
			$display("disp1 -- a1.i==%d,a2.i=%d",a1.i,a2.i);
			a1.i++;
			a2.i++;
			$display("disp2 -- a1.i==%d,a2.i=%d",a1.i,a2.i);
		end
	end
endmodule
*/
/* output:- # KERNEL: disp1 -- a1.i==          2,a2.i=          2
			# KERNEL: disp2 -- a1.i==          3,a2.i=          3
			# KERNEL: disp1 -- a1.i==          2,a2.i=          4
			# KERNEL: disp2 -- a1.i==          3,a2.i=          5
with in a loop if you declaring a handle and object defaulty it becomes static it makes 1 memory
but a1 will makes 2 memories 

*/
/*                      snippet-20         */
/*
class AB;
	int i;
	pure virtual function void disp();
endclass
class BC extends AB;
	int j;
	function void disp(int z);
		j=z;
		$display("%d",j);
	endfunction
endclass
class CD extends AB;
	int k;
	function void display(int z);
		k=z;
		$display("%d",k);
	endfunction
endclass
AB a_h=new();
BC b_h=new();
CD c_h=new();
module test();
	initial 
		begin 
			a_h.disp();
			b_h.disp(2);
			c_h.display(3);
	end
endmodule
*/
/* output:-  ERROR 
if we want to declare pure virtual it must be in virtual class only
*/

/*                      snippet -21                */
/*
class AB;
	rand int i;
	task xyz (string s) ;
		fork
			begin
			#(i);
            end
			begin
			#(20);
			$display("in object of %s,20ns delay is completed",s);
			end
		join_any
		disable fork;
	endtask
endclass
AB a1=new();
AB a2=new();
module test();
	initial
		begin 
			a1.i=5;
			a2.i=30;
				fork 
					a1.xyz("a1");
					a2.xyz("a2");
				join
		end
endmodule
*/
/*    output :- in object of a2,20ns delay is completed


*/


/*                        snippet -22           */
/*
class AB #(type T=int,int width=8);
	T i;
	bit[width-1:0]b;
endclass
AB #(int,8)h1;
AB #(real,16)h2;
AB h3;
*/

/* output :- h1,h3 are possible because of same data type and defaultvales
h2 is not compatible as it is changing data type and overriding

*/