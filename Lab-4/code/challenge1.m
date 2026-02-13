% challenges 1 - fillings

f = imread('assets/fillings.tif');
fc = imcomplement(f);

% Reduce the noise 
% working on reversed image 
SE = strel('disk', 2);
g = imerode(fc, SE);
fr = imreconstruct(g, fc);
fr = imcomplement(fr);

imhist(fr);

% manual level based on histogram
level = 0.9;
BW = imbinarize(fr, level);

% clean isolated pixels
BW = bwmorph(BW, 'clean');

% connected parts
CC = bwconncomp(BW);
FN = CC.NumObjects;
FS = cellfun(@numel, CC.PixelIdxList);

figure;
montage({f, fr, BW}, 'Size', [1 3])

fprintf('Number of fillings: %d\n', FN);
disp('Size of each filling (pixels):');
disp(FS);