% Input data (bipolar inputs)
X = [-1 -1;
     -1  1;
      1 -1;
      1  1];

% Targets for logical XOR (bipolar)
targets = [-1; 1; 1; -1];

% Initialize weights and biases for both Adaline units
w1 = rand(size(X, 2) + 1, 1); % weights for Adaline unit 1
w2 = ones(size(X, 2) + 1, 1) * 0.5; % constant weights for Adaline unit 2
w2(end) = 0.5; % Set bias for Adaline unit 2

% Learning rate
lr = 0.1;

% Maximum number of epochs
num_epochs = 500;

% Training
for epoch = 1:num_epochs
    for i = 1:size(X, 1)
        % Add bias term to input
        X_with_bias = [X(i, :) 1]; 
        
        % Compute output of Adaline unit 1
        y1 = X_with_bias * w1;
        
        % Update weights using Adaline learning rule
        dw1 = lr * (targets(i) - y1) * X_with_bias';
        
        w1 = w1 + dw1; % Update weights for Adaline unit 1
    end
end

% Compute output of Adaline unit 2 (constant)
output2 = ones(size(X, 1), 1) * 0.5; 

% Combine outputs using logical AND
output1 = [X ones(size(X, 1), 1)] * w1 >= 0; 
output = output1 & output2;

% Display trained weights for Adaline unit 1
disp('Trained weights for Adaline unit 1 and bias:');
disp(w1');

% Display constant weights for Adaline unit 2
disp('Constant weights for Adaline unit 2 and bias:');
disp(w2');

% Display outputs of the Madaline
disp('Outputs of the Madaline:');
disp(output');

% Display target values (bipolar encoding)
disp('Target values (bipolar encoding):');
disp(targets');
