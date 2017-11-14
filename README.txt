LOGISTIC REGRESSION, DECISION TREES AND SUPPORT VECTOR MACHINES: PREDICTING
FILM SUCCESS 

STUDENT: CHLOE ZELLER
COMPUTER SCIENCE 347: MACHINE LEARNING
FALL 2017, PROFESSOR KATHRYN LEONARD

PROJECT DESCRIPTION:
- Analysis of data from the Internet Movie Database (IMDB), a website that
  catalogues imformation about movies including but not limited to: the 
  actors featured in them, director, 
- Using this data, we define the best multiple regression we can (by
  maximizing the Adjusted R Squared Statistic), and then test the model on 
  average winter, spring, summer and autumn days in Los Angeles, looking 
  for the model that mximized number of bikes checked out in one day. 


INITIALIZATIONS:
- Required Files
    - README.txt (which you obviously have if you're reading this, congrats!)
    - RUNME.m
    - WordCount.m
    - SupportVectorMachines.m
    - RemoveMissingRows.m
    - logregcv.m
    - LogisticRegression.m
    - InitializeData.m
    - GetResponse.m
    - GetPresdictors.m
    - FixMetascore.m
    - DecisionTree.m
    - ConvertRatingToBinary.m
    - ConvertRankToClasses.m
    - ConvertCharPredictors.m
    - ComputeError.m
    - convert_actors_genre.py
    - bigrams_dictionary.py
    - IMDB-Movie-Data.csv
    - genres.csv
    - description_integers.csv
    - actors.csv
    - GetTop25Movies.m
    - AverageValues.m
    - FindTrends.m
    - Proj3_Tech_Report.docx
- Importing Data
    - Before beginning, you will need to import four separate groups of 
      data, don't worry, the instructions will help. All data is imported 
      from the "IMDB-Movie-Data.csv" file.
        - To do this, go to HOME tab, click "Import Data," and once the 
          window appears, double-click the "IMDB-Movie-Data.csv" file. 
        - Once in the file, select the "title" column, and import it as a 
          cell array. Close the import window (you must do this everytime 
          to make separate arrays).
        - Again, click "Import Data," this time selecting the "director" 
          column, and import as a cell array again. Close the import 
          window.
        - "Import Data" again, and select columns 7-12 (year through 
          metascore), and import as a NUMERIC matrix. Close the import 
          window.
        - Finally, import the first column, "rank" as a numeric matrix. 
    - You should now have four variables in the workspace:
        - IMDBMovieData (the titles)
        - IMDBMovieData1 (the directors)
        - IMDBMovieData2 (all columns with numeric values, except rank)
        - IMDBMovieData3 (the ranks)

RUNNING EXPERIMENT:
- Execution
    - To execute, simply run the RUNME.m script. 
- Output Expectations
    - InitializeData simply returns the necessary arrays to do all the 
      computations in the subsequent functions. 
    - The DecisionTree file should return a visualization of the random 
      forrest tree generated from the data. 
    - Running this script will also save 9 variables in the workspace
        - LogisticRegression will return the betas for the model, the error
          found by doing regular logistic regression, and the average error
          and the confusion matrix for an 8-fold cross validation logistic 
          regression. 
        - SupoortVectorMachine will return the svm model, and the error 
          rate for the model.
        - DecisionTree will return the tree model, and the error rate for 
          the model.
        - FindTrends will return a 3x4 array. Each column corresponds to a 
          different response variable, rank, rating and revenue, 
          respectively. Each row corresponds to the average expected title 
          length, average expected runtime, the average expected votes, and
          the average expected metascore for the top 25 films in that 
          response varaibles categoery (e.g. for revenue, teh top 25 
          grossing films).

PREDICTING YOUR MOVIE'S PERFORMANCE:
- Note: to do this, you will have to get your film's data to a place where
  it's actually interpretable by the RUNME file. This means you need to use
  the other functions in this file to convert your descripton, actors, 
  director and genre into integer values. Here's some help:
    - For DESCRIPTION:
        - Use bigrams_dictionary.py!
    - For ACTORS:
        - Use convert_actors_genre.py!
    - For DIRECTOR:
        - Use ConvertCharPredictors.m!
    - For GENRE:
        - Use convert_actors_genre.py!
- Now, once you have your data in integer form, make sure its in an array,
  and depending on what you want to predict, run this script:
    - PredictMyFame.m
  and it will return the expected revenue of your film.
    

end