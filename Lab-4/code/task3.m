% Boundary detection

% Binary image BW
I = imread('assets/blobs.tif');
I = imcomplement(I);
level = graythresh(I);
BW = imbinarize(I, level);

% Erosed BW
SE = ones(3,3);
E = imerode(BW, SE);

% Subtract the eroded image from BW
BD = BW - E;

montage({I, BW, E, BD}, 'Size', [1 4])