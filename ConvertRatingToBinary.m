function [ binary_response ] = ConvertRatingToBinary( rating )
% Converts the rating respons variable to an array of ones and zeros, one
% if the rating is 7.5 or above, zero otherwise

length = size(rating, 1);

binary_response = zeros(length,1);
for i = 1:length
    if rating(i) >= 7.5
        binary_response(i) = 1;
    end
end


end

