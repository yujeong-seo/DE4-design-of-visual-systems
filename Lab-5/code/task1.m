clear all
close all
f = imread('assets/crabpulsar.tif');

% point detected
w = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];
g1 = abs(imfilter(f, w));

% erosion
se = strel("disk",1);
g2 = imerode(g1, se);
threshold = 100;

% threshold
g3 = uint8((g2 >= threshold)*255);

% figures
montage({f, g1, g2, g3}, 'Size', [1 4]);