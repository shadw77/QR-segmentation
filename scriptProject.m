im='4.4.bmp';
I=imread(im);

rgb=I;
Igray = rgb2gray(rgb);
BW2 = edge(Igray,'canny');
% Perform the Hough transform
[H, theta, rho] = hough(BW2);
% Find the peak pt in the Hough transform
peak = houghpeaks(H);
     
lines = houghlines(BW2, theta, rho, peak);
J=rgb;
% Find the angle of the bars
barAngle = theta(peak(2));
if barAngle <= -87 && barAngle>-90
    J = imrotate(rgb,1.8,'bilinear','crop');  
elseif  barAngle >0
    J = imrotate(rgb,barAngle,'bilinear','crop');
    J = imrotate(rgb,207.6,'bilinear','crop');
          
elseif barAngle ~= -90        
    J = imrotate(rgb,barAngle,'bilinear','crop');        
end
            
%I = locallapfilt(I, 1,0.8, 'NumIntensityLevels', 50);   
I=segmen(J,im);
figure,imshow(I);
