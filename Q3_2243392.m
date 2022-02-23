%% Question 3
%Clear all before start
clear all; clc;

%read my Flower image
myImage = imread('Flower.png');
figure;imshow(myImage);title('Original Flower');

%random number generator interval 0 and 1 with rand function
randomNum = rand(size(myImage));
%I tried different values ​​besides 0.001.
myImage(randomNum(:)<0.001)=0; 
%initializa my array
arr=[0 0 0 ; 0 0 0 ; 0 0 0];

row = size(myImage,1); column = size(myImage,2); %find the row and column of my Image
Output=uint8(zeros(size(myImage,1),size(myImage,2))); %for my output image

for i=2:row-1
    for j=2:column-1
        arr=[myImage(i-1,j-1),myImage(i-1,j),myImage(i-1,j+1),myImage(i,j-1),myImage(i,j),myImage(i,j+1),myImage(i+1,j-1),myImage(i+1,j),myImage(i+1,j+1)];
        %find maximum elements of my arr with max function and keep in final output(i,j)
        Output(i,j)=max(arr);
        arr=[];
    end
end

%write my Brighten Flower Image
imwrite(Output,'EnhancedFlower.jpg');
%show my Enhanced Flower Image
figure, imshow(Output); title('Enhanced Flower Image');
