X = [0 0;
     0 1;
     1 0;
     1 1];

targets = [0; 1; 1; 0];

hidden_weights = rand(size(X, 2) + 1, 2); 
output_weights = rand(3, 1); 

lr = 0.1;

num_epochs = 10000;

% Sigmoid activation function
sigmoid = @(x) 1 ./ (1 + exp(-x));
sigmoid_derivative = @(x) sigmoid(x) .* (1 - sigmoid(x));

for epoch = 1:num_epochs
    hidden_input = [X ones(size(X, 1), 1)] * hidden_weights;
    hidden_output = sigmoid(hidden_input);
    
    output_input = [hidden_output ones(size(hidden_output, 1), 1)] * output_weights;
    output_output = sigmoid(output_input);
    
    % Backward pass
    output_error = targets - output_output;
    output_delta = output_error .* sigmoid_derivative(output_input);
    
    hidden_error = output_delta * output_weights(1:end-1, :)';
    hidden_delta = hidden_error .* sigmoid_derivative(hidden_input);
    
    % Weight updates
    output_weights = output_weights + lr * ([hidden_output ones(size(hidden_output, 1), 1)]' * output_delta);
    hidden_weights = hidden_weights + lr * ([X ones(size(X, 1), 1)]' * hidden_delta);
end

% Test the trained network
hidden_input = [X ones(size(X, 1), 1)] * hidden_weights;
hidden_output = sigmoid(hidden_input);

output_input = [hidden_output ones(size(hidden_output, 1), 1)] * output_weights;
output_output = sigmoid(output_input);

% Display the outputs and compare with target values
disp('Outputs of the MLFFANN:');
disp(output_output');
disp('Target values:');
disp(targets');
