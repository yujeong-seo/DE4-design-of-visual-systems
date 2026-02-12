% task 7 - lake&tree
% original image
f = imread('assets/lake&tree.png');

imhist(f);

% gamma correction
g1 = imadjust(f, [0.15 0.5], [0 1]);

h = histeq(g1,256);

% contrast-stretching
r = double(f);  % uint8 to double conversion
k = mean2(r);   % find mean intensity of image
E = 5;
s = 1 ./ (1.0 + (k ./ (r + eps)) .^ E);
g2 = uint8(255*s);

figure;
montage({f, g1, h, g2}, 'Size', [1 4])