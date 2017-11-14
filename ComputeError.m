function [ error_rate ] = ComputeError( predicted, actual )
% simple function that computes error given a predicted and observed set of
% data

instance_of_error = 0;
n = size(predicted, 1);
for i = 1:n
    if predicted(i) ~= actual(i)
        instance_of_error = instance_of_error + 1;
    end
end

error_rate = instance_of_error / n;

end

