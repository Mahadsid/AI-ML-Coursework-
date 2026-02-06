clear
clc

wx = 0;
Epoch = 1;
no_of_inputs = input('Enter the number of Inputs : ');
row_of_possible_inputs = 2^no_of_inputs;
x = zeros(row_of_possible_inputs,no_of_inputs);
w = zeros(row_of_possible_inputs+1,no_of_inputs);
s = zeros(row_of_possible_inputs,no_of_inputs);
y = zeros(row_of_possible_inputs,no_of_inputs);
wi = input('Enter the number of initial weight, w : ');

%Comment if initial weight, w value are different%
for n =1:1:no_of_inputs
    w(1,n) = wi;
end

%Uncomment if weight, w value are different%
% for n = 1:1:no_of_inputs
%     fprintf('\nW%d\n',n);
%     w(1,n) = input('Enter initial value of the following W : ');
% end


a = input('Enter the value for the Learning Rate, Alpha : ');
theta = input('Enter the value for the Threshold, Theta : ');
b = input('Enter the value for the b : ');
fprintf('\n \n');

for m = 1:1:row_of_possible_inputs
    for n = 1:1:no_of_inputs
        fprintf('x%d%d \n',m,n);
        x(m,n) = input('Enter the following x value : ');
    end
    fprintf('t%d \n',m);
    t(m,1) = input('Enter the following t value : ');
end

fprintf('\n\n');
fprintf('Learning Rate : %.2f\t Threshold : %.2f\n\n',a,theta)
for n = 1:1:no_of_inputs
    fprintf('W%d : %.2f\t',n,w(1,n));
end
fprintf('b = %.2f',b);
fprintf('\n\n');
for m = 1:1:row_of_possible_inputs
    for n = 1:1:no_of_inputs
        if m <=1 && n<no_of_inputs
            fprintf('x%d\t ',n);
        elseif m <=1 && n<=no_of_inputs
            fprintf('x%d\tt\n',n);
            disp('---------------------------------------------------------------------')
            for n1 = 1:1:no_of_inputs
                fprintf('%d\t',x(m,n1));
            end
        else
            fprintf('%d\t',x(m,n));
        end
    end
    fprintf('%d\n',t(m,1));
end
