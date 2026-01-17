# Lab 1 - Introduction to Matlab

## Task 1 - Image Rotation
### Image Rotation Logics
<p align="center"> <img src="images/rotation_plot.jpg" /> </p>
<p align="center"> <img src="images/rotation_eq.jpg" /> </p>

### Forward Mapping
<p align="center"> <img src="images/forward_mapping.jpg" /> </p>
Works out the destination pixel location using the forward mapping equation.

### Reverse Mapping
<p align="center"> <img src="images/reverse_mapping.jpg" /> </p>
Works out where each destination pixel came from in the source image. This uses the inverse of the transformation matrix.

### Results
Forward mapping and reverse mapping codes are written and tested at same angle (pi/6):
<p align="center"> <img src="images/image_rotate.png" /> </p>

Holes in the forward mapping observable: 
<p align="center"> <img src="images/forward_zoomed.png" /> </p>

**🕳️ Why is there a hole in the forward mapping?**
Some pixels in the destination image are mapped with more than one source pixel. At the same time, some pixels are never written to, leaving the destination image with holes.


## Task 2 - Image Shearing
### Image Shearing Logics
<p align="center"> <img src="images/shear_plot.jpg" /> </p>

### Results
<p align="center"> <img src="images/image_shear.png" /> </p>
