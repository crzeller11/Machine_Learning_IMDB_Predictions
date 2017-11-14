function [ predictors ] = GetPredictors( title_data,...
    director_data, numeric_predictors )
% Isolating all the predictor data after cleaning/conversion

% Data isolated from Python NLP/bigrams parsing
description = csvread('description_integers.csv');
actors = csvread('actors.csv');
genre = csvread('genres.csv');

% Data from IMDB cell array
title = WordCount(title_data(2:1001,:));
director = ConvertCharPredictors(director_data(2:1001,:));

% Just raw data from dataset
year = numeric_predictors(:,1);
runtime = numeric_predictors(:,2);
votes = numeric_predictors(:,4);
metascore = FixMetascore(numeric_predictors(:,6), actors);

predictors = horzcat(description, actors, genre, title, director, year,...
    runtime, votes, metascore);

end

