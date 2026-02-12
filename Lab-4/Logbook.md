# Lab 4 - Morphological Image Processing

## Task 1 - Dilation and Erosion
### Dilation Operation

Three distinct structuring element (SE) is applied to original image `text-broken.tif` with dilation operation.

```matlab
A = imread('assets/text-broken.tif');

% Disk
B1 = [0 1 0;
      1 1 1;
      0 1 0];
     
% All 1's
B2 = ones(3,3); 

% Diagonal cross
Bx = [1 0 1;
      0 1 0;
      1 0 1];
      
% Dilate function
A1 = imdilate (A, B1);
A2 = imdilate (A, B2);
Ax = imdilate (A, Bx);
```

| Original  | A1    | A2    | Ax    |
| :---:     | :---: | :---: | :---: |

<table width="100%">
  <thead>
    <tr>
      <th width="25%">Original</th>
      <th width="25%">A1</th>
      <th width="25%">A2</th>
      <th width="25%">Ax</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="4" align="center">
        <img src="images/task1-dilation-2.png" />
      </td>
    </tr>
  </tbody>
</table>
<!--<p align="center"> <img src="images/task1-dilation-2.png" /> </p>-->

Then, the original image is dilated with B1 multiple times.

```matlab
A11 = imdilate(A1, B1);
A111 = imdilate(A11, B1);
```

| Original  | Once      | Twice     | Triple    |
| :---:     | :---:     | :---:     | :---:     |
<p align="center"> <img src="images/task1-dilation-twice.png" /> </p>

What happens?


### Structuring Element

```matlab
SE = strel('disk', 4);
SE.Neighborhood
```

A disk with radius of 4 is created:

<p align="center"> <img src="images/task1-se.png" /> </p>


### Erosion Operation

```matlab
A = imread('assets/wirebond-mask.tif');

SE2 = strel('disk',2);
SE10 = strel('disk',10);
SE20 = strel('disk',20);

% Erode function 
E2 = imerode(A,SE2);
E10 = imerode(A,SE10);
E20 = imerode(A,SE20);
```

| Original  | E2    | E10   | E20   |
| :---:     | :---: | :---: | :---: |
<p align="center"> <img src="images/task1-erosion.png" /> </p>

**Comment on the results**


## Task 2 - Morphological Filtering with Open and Close
### Opening = Erosion + Dilation

```matlab
f = imread('assets/fingerprint-noisy.tif');

% 3x3 structuring element
SE = strel('disk', 1); 

fe = imerode(f, SE);
fed = imdilate(fe, SE);
fo = imopen(f, SE);
```

| f     | fe    | fed   | fo    |
| :---: | :---: | :---: | :---: |
<p align="center"> <img src="images/task2-1.png" /> </p>
<p align="center"> 3x3 disk SE </p>
<p align="center"> <img src="images/task2-disk-2.png" /> </p>
<p align="center"> 4x4 disk SE </p>
<p align="center"> <img src="images/task2-disk-3.png" /> </p>
<p align="center"> 5x5 disk SE </p>
<p align="center"> <img src="images/task2-diamond-3.png" /> </p>
<p align="center"> 3x3 diamond SE </p>
<p align="center"> <img src="images/task2-ones-3.png" /> </p>
<p align="center"> 3x3 ones </p>

what happens with other size and shape of structuring element.

**Improve the image fo with a close operation**


### Comparison to Spatial Filter

Comment on the comparison.


## Task 3 - Boundary Detection

| I     | BW    | Erosed BW   | Boundary detected    |
| :---: | :---: | :---: | :---: |
<p align="center"> <img src="images/task3-boundary.png" /> </p>

Comment on the result.
How can you improve on this result

## Task 4 - Thinning and Thicknening

### Function bwmorph
```matlab
g = bwmorph(f, operations, n)
```
* _f_: input binary image
* _operations_: string for specific operation
* _n_: positive integer, number of times the operation should be repeated (default n = 1)

```matlab
% Initial processing into binary image 
f = imread('assets/fingerprint.tif');
f = imcomplement(f);
level = graythresh(f);
BW = imbinarize(f, level);

% Used cell to perform thinning operation numtiple times 
g = cell(1, 5);
for k = 1:5
    g{k} = bwmorph(BW, 'thin', k);
end

% n = inf. 
ginf = bwmorph(BW, 'thin', inf);

montage({BW, g{1}, g{2}, g{3}}, 'Size', [1 4]);
figure;
montage({g{1}, g{3}, g{5}, ginf}, 'Size', [1 4]);
```

| BW    | g1    | g2    | g3    |
| :---: | :---: | :---: | :---: |
<p align="center"> <img src="images/task4-g123.png" /> </p>

| g1    | g3    | g5    | ginf    |
| :---: | :---: | :---: | :---: |
<p align="center"> <img src="images/task4-g135inf.png" /> </p>


```matlab
gthin = bwmorph(BW, 'thin', 12);
gthin = imcomplement(gthin);
```

<p align="center"> <img src="images/task4-line.png" /> </p>

n=12 found after the iteration: where the result shown close to lines. imcomplement applied to reverse the color back after the thinning operation


## Task 5 - Connected Components and Labels

| Original      | Connected Removed | 
| :---:         | :---:             | 
|![task5-original](images/task5-original.png) | ![task5-removed](images/task5-connected.png)|

```matlab
CC = bwconncomp(t)
```

## Task 6 - Morphological Reconstruction
### Keeping long and thin letters

```matlab
f = imread('assets/text_bw.tif');
se = ones(17,1);
g = imerode(f, se);
fo = imopen(f, se);
fr = imreconstruct(g, f);
```

| f     | g     | fo    | fr    |
| :---: | :---: | :---: | :---: |
<p align="center"> <img src="images/task6-mr.png" /> </p>


### Fill the holes in an image

```matlab
ff = imfill(f);
```

<p align="center"> <img src="images/task6-fill.png" /> </p>



## Task 7 - Morphological Operations on Grayscale Images

<p align="center"> <img src="images/task7-grayscale.png" /> </p>


## Challenges


<style>
    table {
        width: 100%;
    }
</style>