function [ new_rank, new_rating, new_revenue, new_predictors ] = RemoveMissingRows( rank, rating, revenue, predictors )
% Takes a single response array, finds instances of missing data, and
% removes those rows from the predictors and the response

% This only applies to the rows from revenue

TF = ismissing(revenue);
new_rank = rank(TF == 0, :);
new_rating = rating(TF == 0, :);
new_revenue = revenue(TF == 0, :);
new_predictors = predictors(TF == 0,:);

end

