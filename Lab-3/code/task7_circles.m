% task 7 - circles.tif
% original image
f = imread('assets/circles.tif');

% initialise filters
w_sobel = fspecial('sobel');
w_lap = fspecial('laplacian', 0.5);

% median filter and sobel
g_med1 = medfilt2(f, [7 7], 'zero');
g1 = imfilter(g_med1, w_sobel, 0);
g2 = imfilter(g1, w_lap, 0);

% contrast enhancing and sobel
h1 = imadjust(f, [0.1 0.65], [0 1]);
h2 = imadjust(f, [ ], [ ], 2);

g_med2 = medfilt2(h1, [7 7], 'zero');
g3 = imfilter(g_med2, w_sobel, 0);


montage({f, g1, g2, g3}, 'Size', [1 4])
