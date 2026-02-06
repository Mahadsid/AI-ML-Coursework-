% Input data (bipolar inputs)
X = [-1 -1;
     -1  1;
      1 -1;
      1  1];

% Targets for logical AND (bipolar)
targets = [-1; -1; -1; 1];

% Initialize weights
w = rand(size(X, 2), 1);

% Training
for i = 1:size(X, 1)
    % Compute output
    y = X(i, :) * w;
    
    % Update weights using Hebb's learning rule
    w = w + X(i, :)' * (targets(i) - y);
end

% Compute outputs
output = X * w;

% Apply thresholding for bipolar outputs
output(output >= 0) = 1;
output(output < 0) = -1;

% Display trained weights, outputs, and target values
disp('Trained weights:');
disp(w');
disp('Outputs of the Hebbian neuron:');
disp(output');
disp('Target values:');
disp(targets');
