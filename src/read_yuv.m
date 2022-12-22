function [I,B1,B2,B3,P]= read_yuv(filename, format,framenumber)

%Read and display the frames from an .yuv file
%filename='foreman_qcif.yuv';
% % % format='qcif';
% % % length = 100

close all;

fid = fopen(filename, 'r');
  if (fid == -1) 
    error('read_file: cannot open file for reading');
  end

% QCIF input
if (strcmp(format,'qcif')==1)
    width = 176;
    height = 144; 
end
% CIF input
if (strcmp(format,'cif')==1)
    width = 352;
    height = 288; 
end

for(i=1:framenumber-1)
    % dumpped frames
    currentImg = fread(fid,[width height], 'uint8');
    currentImg = currentImg';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
    
end
    I=fread(fid,[width height], 'uint8');
    I=I';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
    
    B1=fread(fid,[width height], 'uint8');
    B1=B1';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
   
    B2=fread(fid,[width height], 'uint8');
    B2=B2';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
    
    B3=fread(fid,[width height], 'uint8');
    B3=B3';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');
    
    P=fread(fid,[width height], 'uint8');
    P=P';
    colorU = fread(fid, [width/2 height/2], 'uint8');
    colorV = fread(fid, [width/2 height/2], 'uint8');

fclose(fid);

end