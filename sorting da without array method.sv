module main();
    int da[];
    int temp;
    initial begin
        da = new[10];
        foreach (da[i]) begin
            da[i] = {$random} % 20;
        end

        // Bubble sort algorithm
        for (int i = 0; i < da.size(); i++) begin
            for (int j = 0; j < da.size() - i - 1; j++) begin
                if (da[j] > da[j + 1]) begin
                    temp = da[j];
                    da[j] = da[j + 1];
                    da[j + 1] = temp;
                end
            end
        end

        $display("Sorted array = %p", da);
    end
endmodule
