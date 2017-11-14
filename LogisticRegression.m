function [B, original_error, avgerr, cm] = LogisticRegression(predictors, response)
% Given a set of predictors and a response varaible (in this case, movie
% rank), and the function will return the betas in the model, the original
% error (of the basic logistic regression), and ther average error and
% confusion matrix for an 8 fold cross validation logisitic regression.

response = response + 1;
length = size(predictors, 1);

% B are the betas, need to reduce the number of predictors to make a good
% model
% predictor matrix had a very large condition number, so the operations on the predictor
% matrix might be unstable.
B = mnrfit(predictors, response);
pihat = mnrval(B, predictors);

% Using pihat, for each row, I need to find the column number with the
% highest probability, and then compare it to the response value
max_index = zeros(length, 2);
for i = 1:length
    [M, I] = max(pihat(i,:));
    max_index(i,1) = M;
    max_index(i,2) = I;
end

instance_error = 0;
labels = zeros(length,1);
for i = 1:length
    if response(i) ~= floor(max_index(i,2)) % if classes don't match
        instance_error = instance_error + 1; % add to error
        labels(i) = 1; % mismatched
    else
        labels(i) = 0; % not mismatched
    end
end

original_error = instance_error / length;

avgerr = logregcv(predictors, response, 8);
cm = confusionmat(response, labels);



end
