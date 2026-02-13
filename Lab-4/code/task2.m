% opening = erosion + dilation

f = imread('assets/fingerprint-noisy.tif');

SE = strel('disk', 1);
% SE = ones(3,3);
% SE = strel('diamond', 1);

fe = imerode(f, SE);
fed = imdilate(fe, SE);
fo = imopen(f, SE);

w_gauss = fspecial('Gaussian', [6 6], 0.5);
w_gauss2 = fspecial('Gaussian', [20 20], 0.5);

g_gauss = imfilter(f, w_gauss, 0);
g_gauss2 = imfilter(f, w_gauss2, 0);


% montage({f, fe, fed, fo}, "size", [1 4])
montage({fo, g_gauss, g_gauss2}, "size", [1 3])
