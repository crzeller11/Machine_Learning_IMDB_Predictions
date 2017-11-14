function [ avgerr] = logregcv(X, y, k)
% computes k-fold cross validation for logistic regressions on labeled data
% X (nxp) with labels y (nx1) where labels are values in [1,...,r]

test_n = floor(size(X,1)/k);
err = zeros(k,1);
indshuffle = transpose(randperm(size(X,1)));
X = X(indshuffle);
y=y(indshuffle);

for jj=1:k
    testinds = (jj-1)*test_n+1:jj*test_n;
    traininds = 1:size(X,1);
    traininds(testinds)=[];
    B = mnrfit(X(traininds, :), y(traininds));
    pihat = mnrval(B, X(testinds,:));
    [~,labels] = max(pihat,[],2);
    err(jj) = sum(abs(y(testinds) - labels))/test_n;   
end%for

avgerr = sum(err)/k;
    

end

