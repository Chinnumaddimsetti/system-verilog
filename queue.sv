module top();
int q1[$]={1,2,3,4,5};
int q2[$]={6,7,8,9};
initial 
	begin 
// inbulit functions in queues are delete,size,push_front,push_back,pop_front,pop_back,insert
q1.delete(1);
q1.insert(1,0);
q1.push_front(1);
q2.push_back(20);
q2.pop_front();
q2.pop_back();
foreach(q1[i])
 $display("%p",q1[i]);
q2.delete();
end
endmodule

