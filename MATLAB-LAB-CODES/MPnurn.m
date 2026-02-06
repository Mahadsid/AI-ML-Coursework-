function output = mcculloch_pitts_neuron(inputs, weights, threshold)
    % Check if the number of inputs matches the number of weights
    if length(inputs) ~= length(weights)
        error('Number of inputs must match number of weights');
    end

    % Calculate the weighted sum
    weighted_sum = sum(inputs .* weights);

    % Apply threshold logic
    if weighted_sum >= threshold
        output = 1;
    else
        output = 0;
    end
end

% Define inputs, targets, weights, and threshold
x = [0 0;
     0 1;
     1 0;
     1 1];
w = [1; 1];
theta = 1.5;
% Compute the output of the McCulloch-Pitts neuron for each input
outputs = zeros(size(x, 1), 1);
for i = 1:size(x, 1)
    inputs = x(i, :);
    output = mcculloch_pitts_neuron(inputs, w, theta);
    outputs(i) = output;
end

% Display the outputs
disp('Outputs:');
disp(outputs);
