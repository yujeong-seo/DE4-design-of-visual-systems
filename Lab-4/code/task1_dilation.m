% Dilation Operation
A = imread('assets/text-broken.tif');

B1 = [0 1 0;
    1 1 1;
    0 1 0];

B2 = ones(3,3);

Bx = [1 0 1;
    0 1 0;
    1 0 1];

A1 = imdilate(A, B1);
A2 = imdilate(A, B2);
Ax = imdilate(A, Bx);

A11 = imdilate(A1, B1);
A111 = imdilate(A11, B1);


% montage({A, A1, A2, Ax}, 'Size', [1 4])
montage({A, A1, A11, A111}, 'Size', [1 4])