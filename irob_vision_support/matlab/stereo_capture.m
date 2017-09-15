function [ I_l, I_r ] = stereo_capture( cam_l, cam_r)
% This function takes images from stereo cameras. 
%   @author: Renata Elek
%   num_img: number of images (use 19 for calibration and 1 for general
%   image capture.
%   resolution: 'BGR24_640x480' in general
%   Call it like this:
%   [I_l, I_r] = stereo_capture(1, 'BGR24_640x480');
    
    dummy = false;

if dummy
 I_l = imread('saved_l.jpg');
 I_r = imread('saved_r.jpg');
else



%preview([cam_l, cam_r]);
% if firstTgt
%     waitforbuttonpress;
% end
%for i = 1:num_img
%     if firstTgt
%         w = waitforbuttonpress;
%     end
     disp('capture');
    tic
    I_l = getsnapshot(cam_l);
    I_r = getsnapshot(cam_r);
    toc
    I_l = imrotate(I_l, 90);
    I_r = imrotate(I_r, -90);
    end   
     disp('Image pair captured.');
%end
end
