function [new_rank, new_rating, new_revenue, new_predictors] = ...
    InitializeData(title_data, director_data, numerical_data, rank_data)
% This fuction parses all the data into a format that is easily
% interpretable by later functions (especially the regression techniques)

% isolate all predictor data
predictors = GetPredictors( title_data,...
    director_data, numerical_data );

% isolate all response, convert rating to binary
[ rank, rating, revenue ] = GetResponse( rank_data, numerical_data );
rating_binary = ConvertRatingToBinary(rating);
[ rank_new ] = ConvertRankToClasses(rank);


% delete rows from data where response data is missing
[ new_rank, new_rating, new_revenue, new_predictors ] = RemoveMissingRows...
    ( rank_new, rating_binary, revenue, predictors );

end


