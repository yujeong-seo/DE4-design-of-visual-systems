# Part 2 - Exploring Colours in MATLAB

For the full code, refer to `color.m` in the `/code` folder.

## Task 10 - Convert RGB image to grayscale

![RGB to grayscale](images/task10-grayscale.png)

```matlab
RGB = imread('peppers.png');
I = rgb2gray(RGB);
imshowpair(RGB, I, 'montage');
```

$$
I=\begin{pmatrix}
0.299 & 0.587 & 0.114
\end{pmatrix} 
\times 
\begin{pmatrix}
R \\ G \\ B
\end{pmatrix}
$$


## Task 11 - Splitting an RGB image into separate channels

![RGB split](images/task11-rgbsplit.png)

```matlab
[R,G,B] = imsplit(RGB);
montage({R, G, B},'Size',[1 3])
```

* Examine the information shown on the right side of the Matlab window. Explain their dimensions and data type of the variables RGB, R, G, B and I.



## Task 12 - Map RGB image to HSV space and into separate channels

![RGB to HSV](images/task12-hsvsplit.png)

```matlab
HSV = rgb2hsv(RGB);
[H, S, V] = imsplit(HSV);
montage({H, S, V},'Size',[1 3]);
```

## Task 13 - Map RGB image to XYZ space

![RGB to XYZ](images/task13-rgbtoxyz.png)

```matlab
XYZ = rgb2xyz(RGB);
```
