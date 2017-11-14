function [ bucks ] = PredictRevenue( model, your_movie_data )
% Given a decision tree model and an array of data for your movie, this
% function will return your film's expected revenue (in millions)

bucks = predict(model, your_movie_data);

end

