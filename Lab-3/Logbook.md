# Lab 3 - Intensity Transformation and Spatial Filtering

## Task 1 - Contrast enhancement with function imadjust
### Importing an image

```matlab
f = imread('assets/breastXray.tif');
f(3,10)             % intensity of pixel(3,10) ans = 28
imshow(f(1:285,:))  % display only top half of the image
```

Indices of 2D matrix in Matlab is of the format: (row, column). ':' is used to slice the data. The default ':' refers to the entire columns.

```
imshow(f(:,241:482))
```

The size of the image is `571x482` (from workspace), so right half will be after pixel 241.

| f(1:285,:)        | f(:,241:482)      | 
| :---:             | :---:             | 
|![breast-org](images/breastXray_top.png) | ![breast-half](images/breastXray_right.png)|

```matlab
[fmin, fmax] = bounds(f(:))
```

`bounds` returns the maximum and minimum values in the entire image f.

The full intensity range is [0 255], and the values returned are `fmin = 21` and `fmax = 255`. It returns the value close the full range, as the image has the part ranging from light to dark. 


### Negative Image

```matlab
g1 = imadjust(f, [0 1], [1 0])
% g1 = imadjust(input, [low_in high_in], [low_out high_out])
```

As a result, 0, the lowest pixel intensity, is mapped to 1, the highest pixel intensity. Vice versa, 1 is mapped to 0. The intensities are inverted and g1 returns the inverted image.

<p align="center" width=500> <img src="images/breastXray_invert.png" /> </p>


### Gamma Correction

```
g2 = imadjust(f, [0.5 0.75], [0 1]);
g3 = imadjust(f, [ ], [ ], 2);
```

<p align="center" width=500> <img src="images/breastXray_gamma.png" /> </p>

Left, `g2` maps the grayscale range between 0.5 and 0.75, to the full range. On the right, `g3` uses gamma correct with gamma = 2.0. 

While two generates the similar result that compresses the low end and expands the high end, `g3` retains more detail as the intensity covers the entire grayscale range.

<p align="center"> <img src="images/gamma.jpg" /> </p><BR>

Testing with different gamma values:
| gamma = 0.75      | gamma = 3         | 
| :---:             | :---:             | 
|![breast-org](images/breastXray_gamma_low.png) | ![breast-half](images/breastXray_gamma_high.png)|


## Task 2 - Contrast-stretching transformation

This task uses constrast stretching transformation function instead of imadjust.

<p align="center"> <img src="images/stretch.jpg" /> </p><BR>

$$s = T(r) = {1 \over 1 + (k/r)^E}$$ 

```matlab
f = imread('assets/bonescan-front.tif');
r = double(f);  % uint8 to double conversion
k = mean2(r);   % find mean intensity of image
E = 0.9;
s = 1 ./ (1.0 + (k ./ (r + eps)) .^ E);
g = uint8(255*s);
imshowpair(f, g, "montage")
```

<p align="center"> <img src="images/bonescan_contrast.png" /> </p><BR>

* k: often set to the average intensity level 
* E: steepness of the function


## Task 3 - Contrast Enhancement using Histogram
### Plotting the histogram of an image

The histogram of `pollen.tif` shows that the intensity of the image is very squashed up between 70 to 140. To spread out the intensity, the intensity between 0.3 and 0.55 can be mapped to full range using imadjust. 

```matlab
f=imread('assets/pollen.tif');
g=imadjust(f,[0.3 0.55]);
montage({f, g})
```

<p align="center"> <img src="images/task3_f_g_img.png" /> </p><BR>
<p align="center"> <img src="images/task3_hist.png" /> </p><BR>
<p align="center"> <img src="images/task3_g_hist.png" /> </p><BR>


### Histogram, PDF and CDF

```matlab
g_pdf = imhist(g) ./ numel(g);  % compute PDF
g_cdf = cumsum(g_pdf);          % compute CDF
```

| PDF           | CDF           | 
| :---:         | :---:         | 
|![pollen-pdf](images/task3_pdf.png) | ![pollen-cdf](images/task3_cdf.png)|

### Histogram Equalization

```matlab
h = histeq(g,256);
% histogram equalize g
```

<p align="center"> <img src="images/task3_f_g_h_img.png" /> </p><BR>
<p align="center"> <img src="images/task3_f_g_h_hist.png" /> </p><BR>


## Task 4 - Noise reduction with lowpass filter

Produce a 9x9 averaging filter kernel and a 7x7 Gaussian kernel using `fspecial`:

```matlab
w_box = fspecial('average', [9 9])
w_gauss = fspecial('Gaussian', [7 7], 0.5)

g_box = imfilter(f, w_box, 0);
g_gauss = imfilter(f, w_gauss, 0);
```

<p align="center"> <img src="images/task4_filter.png" /> </p><BR>


**Comments**

Explore various kernel size and sigma value for these two filters. Comment on the trade-off between the choice of these parameters and the effect on the image.


## Task 5 - Median Filtering

```matlab
g_median = medfilt2(f, [7 7], 'zero');
% medfilt2(I, [m n], padopt) 
```

<p align="center"> <img src="images/task5_median.png" /> </p><BR>


## Task 6 - Sharpening the image with Laplacian, Sobel and Unsharp filters

<p align="center"> <img src="images/task6.png" /> </p><BR>

Original, Laplacian, Sobel and Unsharp

## Task 7 - Test yourself Challenges