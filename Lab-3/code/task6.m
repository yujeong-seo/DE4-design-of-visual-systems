f = imread('assets/moon.tif');

w_lap = fspecial('laplacian', 0.5);
w_sobel = fspecial('sobel');
w_unsharp = fspecial('unsharp', 0.5);

g_lap = imfilter(f, w_lap, 0);
g_sobel = imfilter(f, w_sobel, 0);
g_unsharp = imfilter(f, w_unsharp, 0);

figure;
montage({f, g_lap, g_sobel, g_unsharp}, 'Size', [1 4])