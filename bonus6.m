rgbImage = imread('6.2.bmp');
figure,imshow(rgbImage);
[rows, columns, ~] = size(rgbImage);
middleRow = round(rows/2);
middleColumn = round(columns/2);
upperLeft = rgbImage(1:middleRow, 1:middleColumn, :);
upperRight = rgbImage(1:middleRow, middleColumn + 1 : end, :);
lowerLeft = rgbImage(middleRow + 1 : end, 1:middleColumn, :);
lowerRight = rgbImage(middleRow + 1 : end, middleColumn + 1 : end, :);
subplot(2,2,1);
imshow(upperLeft);
imshow(upperRight);
imshow(lowerLeft);
imshow(lowerRight);

bw = ~im2bw(upperLeft);

bw2 = imclearborder(imclose(bw, strel('square', 3)));%3
bw3 = bwareafilt(bw2, 3);
bw3 = imdilate(bw3, strel('square', 3));%1
[r,c] = find(bw3);
rect = [min(c) min(r) max(c)-min(c) max(r)-min(r)];
figure; imshow(img);
hold on; rectangle('position', rect, 'EdgeColor', 'g', 'LineWidth', 2);
qr_img = imcrop(img, rect);
figure; imshow(qr_img);
Level2 = mat2tiles(Image,[2,2]);
subimages = mat2tiles(Level2,[2,2]);
figure; imshow(subimages);
