%% Question 1
%Clear all before start
clear all; clc;
%read my EncodedText image
myImage = imread('EncodedText.png');
%show my image
figure; imshow(myImage); title('EncodedText Image');
%find row and column of my image
rows = size(myImage,1); columns = size(myImage,2);
% number of pixel = rox*column, my image [m x n] matrix
pixels = rows * columns;

hist = zeros(256,1); %create an empty array with 256 elements for finding how many have the same value
value = 0;
for i=1:rows %loop for rows of matrix
    for j=1:columns %loop for columns of matrix
        %how many have the same value
        %find the frequency of each pixels
        for k=0:255
            if(myImage(i,j) == k)
               value = myImage(i,j); %this is my value which is i,j index
               hist(value+1)=hist(value+1)+1;  %write the value to the empty hist array 
            end
        end
    end
end
a = 0;

probOfFreq = zeros(256,1); %create an empty array with 256 elements for probability of each frequency
%find probability of each frequency
for i=1:rows 
    for j=1:columns 
        a = myImage(i,j);
        probOfFreq(a+1)=hist(a+1)/pixels;
    end
end

cumHist = zeros(256,1); %create an empty array with 256 elements for cumulative histogram 
%find the cumuliative histogram of each pixel
sizeOfProb = size(probOfFreq);
sum = 0; %initialize the summation is zero
for i=1:sizeOfProb
    sum = sum + hist(i);
    cumHist(i) = sum;
end

CumDistProb = zeros(256,1); %create an empty array with 256 elements for cumulative distribution probability
finalValue = zeros(256,1); %for my final array
%find the cumulative distribution probability of each pixel
for i=1:sizeOfProb
    CumDistProb(i) = cumHist(i) / pixels;
    finalValue(i) = round(CumDistProb(i)*255);
end


DecodedImage=uint8(zeros(size(myImage,1),size(myImage,2))); %for my final image
for i=1:rows
    for j=1:columns
        value = myImage(i,j);
        DecodedImage(i,j)=finalValue(value+1);
    end
end


%write my decoded Image
imwrite(DecodedImage,'DecodedText.png');
%show my decoded Image
figure;imshow(DecodedImage); title('DecodedText Image');
