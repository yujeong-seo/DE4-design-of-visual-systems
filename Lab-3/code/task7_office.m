% task 7 - office
% original image
f = imread('assets/office.jpg');

imhist(f);

% gamma correction
g1 = imadjust(f, [], [], 0.6);
g2 = imadjust(f, [0.15 0.6], [0 1]);

h = histeq(g2,256);

figure;
montage({f, g1, g2, h}, 'Size',[1 4])