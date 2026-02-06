% Input data and targets
X = [0 0;
     0 1;
     1 0;
     1 1];
targets = [0; 0; 0; 1];

% Initialize weights and bias
weights = rand(size(X, 2) + 1, 1); % Initialize weights with random values
bias = 0; % Initialize bias

% Parameters
learning_rate = 0.1;
max_epochs = 100;

% Train the perceptron
for epoch = 1:max_epochs
    for i = 1:size(X, 1)
        % Append bias to input
        X_with_bias = [X(i, :) 1];
        
        % Compute predicted output
        y = X_with_bias * weights >= 0;
        
        % Update weights and bias based on error
        weights = weights + learning_rate * (targets(i) - y) * X_with_bias';
        bias = bias + learning_rate * (targets(i) - y);
    end
end

% Display trained weights and bias
disp('Trained weights:');
disp(weights');
disp('Trained bias:');
disp(bias);

% Make predictions
output = [X ones(size(X, 1), 1)] * weights >= 0;

% Display predictions and targets
disp('Outputs of the perceptron:');
disp(output');
disp('Target values:');
disp(targets');
