module top();
    int a = 5, b = 7;
    int sum, dbl;

    function int summation(input int x, input int y, output int z);
        summation = x + y;
        z = 2 * summation;
    endfunction

    function void display();
        $display("sum is %d and double value is %d", sum, dbl);
    endfunction

    initial begin
        sum = summation(a, b, dbl);
        display();
    end
endmodule
