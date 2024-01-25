cc;

% Read the image
RGB = imread('peppers.png');  

% Convert to grayscale
I = rgb2gray(RGB);

% Display both images in a pair
imshowpair(RGB, I, 'montage')
title('Original colour image (left) grayscale image (right)');

% Splitting R, G and B
[R,G,B] = imsplit(RGB);
montage({R, G, B},'Size',[1 3])

% Spitting to HSV and displaying
HSV = rgb2hsv(RGB);
[H, S, V] = imsplit(HSV);
montage({H, S, V}, 'Size', [1 3])

% Spitting to XYZ and displaying
XYZ = rgb2xyz(RGB);
[X, Y, Z] = imsplit(XYZ);
montage({X, Y, Z}, 'Size', [1 3])