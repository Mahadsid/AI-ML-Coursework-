% Input data
X = [0 0;
     0 1;
     1 0;
     1 1];

% Targets for logical AND
targets = [0; 0; 0; 1];

% Initialize weights and bias with random values
num_inputs = size(X, 2);
weights = rand(num_inputs, 1);
bias = rand;

% Learning rate
learning_rate = 0.1;

% Maximum number of epochs
max_epochs = 100;

% Training
for epoch = 1:max_epochs
    for i = 1:size(X, 1)
        % Compute output
        y = X(i, :) * weights + bias;
        
        % Update weights and bias using Adaline learning rule
        weights = weights + learning_rate * (targets(i) - y) * X(i, :)';
        bias = bias + learning_rate * (targets(i) - y);
    end
end
% Compute outputs
output = X * weights + bias;

% Apply thresholding for binary classification
output(output >= 0.5) = 1;
output(output < 0.5) = 0;

% Display trained weights, bias, outputs, and target values
disp('Trained weights:');
disp(weights');
disp('Trained bias:');
disp(bias);
disp('Outputs of the Adaline network:');
disp(output');
disp('Target values:');
disp(targets');
