function [ metascore_revised ] = FixMetascore( metascore_original, actors)
% This function replaces the missing rows in the metascore data by creating
% a linear regression with actors (which had a correlation in pilot
% testing), and predicting the metascore.

% need to isolate the rows at which metascore is missing data
TF = ismissing(metascore_original);
reduced_metascore_set = metascore_original(TF == 0, :);
reduced_set = actors(TF == 0,:);
predictors1 = actors(TF == 1, :);

% FIXME: Need a much better model
model = fitlm(reduced_metascore_set, reduced_set);
fillers = floor(predict(model, predictors1));

metascore_revised = metascore_original;

for i = 1:size(metascore_original,1)
    index = 1;
    if TF(i) == 1
        metascore_revised(i) = fillers(index);
        index = index + 1;
    end
end


end