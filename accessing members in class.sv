module test_class_defn;
	class account_c;
	int balance;
	function int summary;
		return balance;
	endfunction
	task deposit(input int pay);
		balance=balance+pay;
	endtask
	endclass
account_c acnt_h=new;
acct_h.deposit(2000);
$display("balance is %d",acnt_h.summary());
$display("balance is %d",acnt_h.balance);
endmodule