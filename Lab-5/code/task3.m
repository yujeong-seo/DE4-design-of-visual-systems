clear all; 
close all;

f = imread('assets/circuit_rotated.tif');
fEdge = edge(f,'Canny');
figure(1)
montage({f,fEdge})

% Perform Hough Transform and plot count as image intensity
[H, theta, rho] = hough(fEdge);
figure(2)
imshow(H,[],'XData',theta,'YData', rho, ...
            'InitialMagnification','fit');
xlabel('theta'), ylabel('rho');
axis on, axis normal, hold on;
