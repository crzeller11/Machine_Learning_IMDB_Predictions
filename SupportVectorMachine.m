function [ svmmdl, original_error ] = SupportVectorMachine(predictors, response)
% Using a set of predictors and a response variable (in this case, movie
% rating), this function will return the generated model, and the error
% rate of the model.

length = size(response,1);

% RBF SVM
svmmdl = fitcsvm(predictors, response, 'Standardize', true, ...
    'KernelFunction', 'RBF', 'KernelScale', 'auto', 'CrossVal', 'on');

classes_RBF = kfoldPredict(svmmdl);
instance_of_error = 0;
for i = 1:length
    if response(i) ~= classes_RBF(i)
        instance_of_error = instance_of_error +1;
    end
end

original_error = instance_of_error / length;


end