% Task 10 - Convert RGB to Grayscale
RGB = imread('peppers.png');
I = rgb2gray(RGB);

figure;
imshowpair(RGB, I, 'montage');
title('Original image (left) and Grayscale image (right)');


% Task 11 - Split RGB in separate channels
[R, G, B] = imsplit(RGB);
% montage({R, G, B},'Size',[1 3]);


% Task 12 - Map RGB to HSV
HSV = rgb2hsv(RGB);
[H, S, V] = imsplit(HSV);
montage({H, S, V},'Size',[1 3]);


% Task 13 - RGB to XYZ space
XYZ = rgb2xyz(RGB);
figure;
imshowpair(RGB, XYZ, 'montage');