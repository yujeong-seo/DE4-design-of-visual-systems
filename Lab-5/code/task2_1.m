clear all
close all
f = imread('assets/circuit.tif');

% task 2 - parameters not set
% [g1, t1] = edge(f, 'sobel');
% [g2, t2] = edge(f, 'log');
% [g3, t3] = edge(f, 'canny');

% task 2 - LoG parameter
% [g1, t1] = edge(f, 'log', 0)
% [g2, t2] = edge(f, 'log');

% task 2 - Canny parameter
[g1, t1] = edge(f, 'canny', 0.1);
[g2, t2] = edge(f, 'canny', 0.4);
[g3, t3] = edge(f, 'canny', 0.8);


% figures
montage({f, g1, g2, g3}, 'Size', [1 4]);