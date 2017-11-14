function [ title_array ] = WordCount( title_cell )
% Converts a cell of strings into an array of integers representing the
% count of words in each string.

% To be used on the title predictor.

num_titles = length(title_cell(:,1));

title_array = zeros(num_titles, 1);
for i = 1:num_titles
    title = char(title_cell(i));
    num_words = strsplit(title);
    title_array(i) = length(num_words(1,:));
end


end

