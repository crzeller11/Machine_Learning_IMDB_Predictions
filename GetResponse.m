function [ rank, rating, revenue ] = GetResponse( rank_data, numeric_predictors )
% This function isolates all the data needed for the response

rank = rank_data(2:1001,:);
rating = numeric_predictors(:,3);
revenue = numeric_predictors(:,5);

end

