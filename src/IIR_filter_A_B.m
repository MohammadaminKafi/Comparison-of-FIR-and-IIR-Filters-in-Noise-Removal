function [output]=IIR_filter_A_B(A, B)
    x_coef = [1 -B 1];
    y_coef = [1 -A*B A^2];
    
    freqz(x_coef, y_coef, 8000, 8000);

    output = 1;
end