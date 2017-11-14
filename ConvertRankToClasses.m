function [ response ] = ConvertRankToClasses( rank_data )
% Converts ranking data into groups of 0-10 integers

length = size(rank_data,1);
response = zeros(length,1);

for i = 1:length
    value = floor(rank_data(i) / 100);
    response(i) = value;
end
        

end

