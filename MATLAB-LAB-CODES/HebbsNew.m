% Input data (bipolar inputs)
X = [-1 -1;
     -1  1;
      1 -1;
      1  1];

% Targets for logical AND (bipolar)
targets = [-1; -1; -1; 1];

% Initialize weights and bias
w = [1; 1]; % Initial weights
b = 1; % Initial bias

% Maximum number of epochs
num_epochs = 1; % Adjust the number of epochs as needed

% Training
for epoch = 1:num_epochs
    for i = 1:size(X, 1)
        % Compute output
        y = X(i, :) * w + b;

        % Update weights and bias using Hebb's rule
        w = w + X(i, :)' * targets(i);
        b = b + targets(i);
    end
end

% Display trained weights and bias
disp('Trained weights:');
disp(w');
disp('Trained bias:');
disp(b);

% Compute predicted output
predicted_output = sign(X * w + b);

% Display predicted output
disp('Predicted output:');
disp(predicted_output);
