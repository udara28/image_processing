[img,map] = imread('images/hgrgb.png');
[h w c] = size(img);
imshow(img);
title('Original Image');    pause;
%red image
red_img = img;
red_img(:,:,2) = zeros(h,w);
red_img(:,:,3) = zeros(h,w);
imshow(red_img);
title('Red Image');     pause;
%green image
grn_img = img;
grn_img(:,:,1) = zeros(h,w);
grn_img(:,:,3) = zeros(h,w);
imshow(grn_img);
title('Green Image');   pause;
%blue image
blu_img = img;
blu_img(:,:,1) = zeros(h,w);
blu_img(:,:,2) = zeros(h,w);
imshow(blu_img);
title('Blue Image');    pause;
%gray scale image
gry_img = rgb2gray(img);
imshow(gry_img);
title('Grayscale Image');   pause;



