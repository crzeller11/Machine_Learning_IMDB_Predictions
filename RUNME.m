% DISCLAIMER: In order to run this code, you need to import the numeric and
% cell arrays as detailed in the README! Without importing, you will not be
% able to run the code below. 

% OBJECTIVE: Run this code to produce error rates for logisitic regression 
% on ranking, support vector machines on rating, and random forrest based 
% decision trees for reveue. 

[ rank, rating, revenue, predictors ] = InitializeData(IMDBMovieData, ...
    IMDBMovieData1, IMDBMovieData2, IMDBMovieData3);

[ B, logreg_original_error, logreg_avgerr, logreg_cm ] = LogisticRegression...
    (predictors, rank);
[ svmmodel, SVM_error ] = SupportVectorMachine(predictors, rating); 
[ treemdl, rf_error ] = DecisionTree(predictors, revenue);

[ trends ] = FindTrends( predictors, rank, rating, revenue );