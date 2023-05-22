function[A]= segmen(I,im)
xx=I;
I=im2gray(I);
% I = imsharpen(I,'Radius',7,'Amount',1);                
BW2 = edge(I);
se = strel('square', 2);
I = imclose(I, se);
I=imdilate(BW2,strel('square',5));
if strcmp(im,'4.4.bmp') ==1
    se = strel('square',4);
    I = imdilate(I, se);
else
    se = strel('square', 4);
    I = imclose(I, se);  
    se = strel('square',15);           
    I = imerode(I, se);
  
    se = strel('square', 4);
    I = imclose(I, se);
 
    BW2 = edge(I,'canny');
    I=imdilate(BW2,ones(10,10));
    se = strel('square',10);
    I = imerode(I, se);
  
    se = strel('square',2);
    I = imdilate(I, se);
 end
bw3 = bwareafilt(I, 1);
I = imdilate(bw3, strel('square', 9));

[h,w,c]=size(I);
new=zeros(h,w);
[p,num]=bwlabel(I);    %num=nunber of connected objects
S=regionprops(p,'BoundingBox');

X=S.BoundingBox(1);   %the x coordinate of the left of the box. 
Y=S.BoundingBox(2);   %the y coordinate of the bottom of the box.
W=S.BoundingBox(3);   % the width of the box
H=S.BoundingBox(4);   % the height of the box.
x=int64(X);
y=int64(Y);
I =imcrop(xx,[X,Y,W,H]);
BW= im2bw(I);
x=labeloverlay(I,BW,"Colormap",[1 1 1; 1 1 1]);
A=x;
