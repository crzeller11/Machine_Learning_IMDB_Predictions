function [ top_predictors ] = GetTop25Movies( predictors, response )
% This function finds the data for the 25 top grossing films

N = 25;
[value, index] = sort( response(:), 'descend' );
top_response = zeros(N,1);
top_predictors = zeros(N, size(predictors,2));
for i = 1:N
    top_response(i) = value(i);
    top_predictors(i,:) = predictors(index(i),:);
end


end

