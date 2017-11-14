function [ concatenation ] = FindTrends( predictors, rank, rating, revenue )
    
% Find Trends
% This function takes the predictors and each response varaible, and returns
% the average title length, average runtime, average number of votes, and
% average metascore rank for the top 25 films in each response variable
% category.

[ top_rank_predictors ] = GetTop25Movies( predictors, rank );
[ top_rating_predictors ] = GetTop25Movies( predictors, rating );
[ top_revenue_predictors ] = GetTop25Movies( predictors, revenue );

[ rank_array ] = AverageValues( top_rank_predictors );
[ rating_array ] = AverageValues( top_rating_predictors );
[ revenue_array ] = AverageValues( top_revenue_predictors );

concatenation = horzcat(rank_array, rating_array, revenue_array);

end