% opening = erosion + dilation

f = imread('assets/fingerprint-noisy.tif');

SE = strel('disk', 1);
% SE = ones(3,3);
% SE = strel('diamond', 2);

fe = imerode(f, SE);
fed = imdilate(fe, SE);
fo = imopen(f, SE);

w_gauss = fspecial('Gaussian', [8 8], 0.5);
g_gauss = imfilter(f, w_gauss, 0);

% montage({f, fe, fed, fo}, "size", [1 4])
montage({f, fo, g_gauss}, "size", [1 3])
