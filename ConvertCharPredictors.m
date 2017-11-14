function [ converted_predictor ] = ConvertCharPredictors( char_predictor )
% This function takes one predictor of character type, and converts it to
% an array of integers, corresponding to the uniqueness of the label seen
% in the character array. 

% This only applies to the director predictor

size_labels = length(char_predictor(:,1)); % total number of rows

unique_labels = unique(char_predictor); % unique directors

% Create a code for unique values, represented in integers
% makes an array with one integer for each of the unique directors
num_unique_labels = length(unique_labels(:,1)); 
integer_code = zeros(num_unique_labels, 1);
for i = 1:num_unique_labels
    integer_code(i) = i;
end

% Create a map from unique string to integer code
map = containers.Map(unique_labels, integer_code);

% Create new integer array
converted_predictor = zeros(size_labels(1), 1);
for i = 1:size_labels(1)
    label = cellstr(char_predictor{i});
    value = values(map, label);
    converted_predictor(i) = cell2mat(value);
end


end

