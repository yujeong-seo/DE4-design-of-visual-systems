f = imread('assets/noisyPCB.jpg');

w_box = fspecial('average', [9 9]);
w_gauss = fspecial('Gaussian', [7 7], 0.5);

g_box = imfilter(f, w_box, 0);
g_gauss = imfilter(f, w_gauss, 0);

figure;
montage({f, g_box, g_gauss}, 'Size', [1 3])