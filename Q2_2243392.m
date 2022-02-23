%% Question 2
%Clear all before start
clear all; clc;
%read my Lena image
myImage = imread('Lena.jpg');
%show my image
figure; imshow(myImage);title('Original Lena');

% 64 < r1 < 128
% 0 < s1 < 64
% 128 < r2 < 192
% 192 < s2 < 255
%I also tried different values for r1,r2,s1,s2
r1 = 95;
s1 = 55;
r2 = 170;
s2 = 196;
L = 256 - 1;

% find slope a, T(r), b
a = (s1-0)/(r1-0);
Tr = (s2-s1)/(r2-r1);
b = (L-s2)/(L-r2);

rows = size(myImage,1); columns = size(myImage,2); %find row and column of my image
EnhancedImage=uint8(zeros(size(myImage,1),size(myImage,2))); %for my final image
for i=1:rows
    for j=1:columns
        if myImage(i,j) > 0 && myImage(i,j) <= r1
            r = myImage(i,j);
            EnhancedImage(i,j) = r;
        elseif myImage(i,j) > r1 && myImage(i,j) <= r2
            r = myImage(i,j);
            EnhancedImage(i,j) = Tr * (r - r1) + s1;
        elseif myImage(i,j) > r2 && myImage(i,j) <= 255
            r = myImage(i,j);
            EnhancedImage(i,j) = b * (r - r2) + s2;
        end
    end
end
%write my Enhanced Lena Image
imwrite(EnhancedImage,'EnhancedImage.jpg');
%show my Enhanced Lena Image
figure;imshow(EnhancedImage);title('Enhanced Image Lena');




