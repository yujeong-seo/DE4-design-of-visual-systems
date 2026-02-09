% morphological reconstruction

f = imread('assets/text_bw.tif');
SE = ones(17,1);
g = imerode(f, SE);
fo = imopen(f,SE);
fr = imreconstruct(g, f);

montage({f, g, fo, fr}, 'Size', [1 4])

ff = imfill(f);
figure
montage({f, ff})