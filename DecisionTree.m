function [ rfmdl, rf_error ] = DecisionTree(predictors, response)
% This function uses random forrests to determine a decision tree for a set
% of predictors and one response variable.

% In the case of this analysis, the response variable is revenue. 

% Create model, predict data, and compute error rate of model
rfmdl = TreeBagger(4, predictors, response, 'Method',...
    'classification', 'NumPredictorsToSample', round(sqrt(4)));
rf_predictions_training = predict(rfmdl, predictors);
rf_error = ComputeError(str2double(rf_predictions_training),...
    response);

% view schematic of the fully contructed tree
view(rfmdl.Trees{4}, 'Mode', 'graph');

end