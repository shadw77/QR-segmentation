clc; clear all; close all;
img = imread('5.1.bmp');                         %5.1  and  5.2
%imshow(img)
bw = ~im2bw(img);

bw2 = imclearborder(imclose(bw, strel('square', 9)));%3  %10و10 for5.1
%9,9 for 5.2
bw3 = bwareafilt(bw2, 1);
bw3 = imdilate(bw3, strel('square', 10));%1
[r,c] = find(bw3);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
figure; imshow(img);
hold on; rectangle('position', rect, 'EdgeColor', 'g', 'LineWidth', 2);
qr_img = imcrop(img, rect);
figure; imshow(qr_img);
