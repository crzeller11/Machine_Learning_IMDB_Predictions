function [ new_array ] = AverageValues( top_predictors )
% Given the top films of one predictor type, find their average title 
% length, average runtimes, average number of votes, and average metascore
new_array = zeros(4,1);
new_array(1,1) = sum(top_predictors(:,4)) / size(top_predictors,1);
new_array(2,1) = sum(top_predictors(:,7)) / size(top_predictors,1);
new_array(3,1) = sum(top_predictors(:,8)) / size(top_predictors,1);
new_array(4,1) = sum(top_predictors(:,9)) / size(top_predictors,1);

end

