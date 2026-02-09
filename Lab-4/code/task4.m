% Function bwmorph - thinning and thickening

f = imread('assets/fingerprint.tif');
f = imcomplement(f);
level = graythresh(f);
BW = imbinarize(f, level);

g = cell(1, 5);

for k = 1:5
    g{k} = bwmorph(BW, 'thin', k);
end

ginf = bwmorph(BW, 'thin', inf);

% montage({BW, g{1}, g{2}, g{3}}, 'Size', [1 4]);
% montage({g{1}, g{3}, g{5}, ginf}, 'Size', [1 4]);

% black lines on white background
for k = 1:5
    g{k} = imcomplement(g{k});
end

gthin = bwmorph(BW, 'thin', 12);
gthin = imcomplement(gthin);

montage(gthin)
