
function mainEncoder()

clc;
[I,B1,B2,B3,P]= read_yuv('foreman_qcif.yuv','qcif',6);

Q = 3;
block_size = 8;
search_parameter= 16;

%  figure(2), imagesc(B), colormap(gray);
%  figure(3), imagesc(P), colormap(gray);

% encodage spatial pour la frame I 

[btsI,Irec] = spatialencoder(I,block_size, Q);
figure(1), imagesc(P);
% encodage pour la frame P
[Mvs,c] = motionEstimation_FS(P,Irec,block_size,search_parameter);

PredP = motionCompensation(Irec,Mvs,block_size);
figure(2) , imagesc(PredP);
%residuel de P 
ResP = P-PredP;
figure(3) , imagesc(ResP) , colormap(gray);

[btsP,ResPrec] = spatialencoder(ResP,block_size,Q);

%image de p reconstruite
Prec =ResPrec + PredP ;

figure(4), imagesc(Prec), colormap(gray);
% encodage pour les frames B1,B2,B3

%Pour B1

[Mvleft,left] = motionEstimation_FS(B1,Irec,block_size,search_parameter);

PredB1left = motionCompensation(Irec , Mvleft,block_size);


[Mvright,right] = motionEstimation_FS(B1,Prec,block_size,search_parameter);
PredB1right = motionCompensation(Prec , Mvright,block_size);

PredB1 = 0.75*PredB1left + 0.25*PredB1right;

ResB1 = B1 - PredB1;

[btsB1,ResBrec1] = spatialencoder(ResB1,block_size,Q);

% Image B1 recontruite%
B1rec =ResBrec1 + PredB1 ;

%Pour B2%

[Mvleft,left] = motionEstimation_FS(B2,Irec,block_size,search_parameter);
PredB2left = motionCompensation(Irec , Mvleft,block_size);


[Mvright,right] = motionEstimation_FS(B2,Prec,block_size,search_parameter);
PredB2right = motionCompensation(Prec , Mvright,block_size);

PredB2 = 0.5*PredB2left + 0.5*PredB2right;

ResB2 = B2- PredB2;
[btsB2,ResBrec2] = spatialencoder(ResB2,block_size,Q);

% Image B2 recontruite%
B2rec =ResBrec2 + PredB2 ;

%Pour B3%

[Mvleft,left] = motionEstimation_FS(B3,Irec,block_size,search_parameter);
PredB3left = motionCompensation(Irec , Mvleft,block_size);


[Mvright,right] = motionEstimation_FS(B3,Prec,block_size,search_parameter);
PredB3right = motionCompensation(Prec , Mvright,block_size);

PredB3 = 0.25*PredB3left + 0.75*PredB3right;

ResB3 = B3 - PredB3;
[btsB3,ResBrec3] = spatialencoder(ResB3,block_size,Q);

% Image B3 recontruite%
B3rec =ResBrec3 + PredB3 ;

 

