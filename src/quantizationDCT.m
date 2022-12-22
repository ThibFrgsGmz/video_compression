function quantizationDCT()

   % Work plan: 
   %  - do the block quantization by firstly retaining the most important "xc"
   % transform coefficients as defined by the different scanning methods (zig-zag, horizontal, vertical)
   %  - check the reconstruction error, expressed as SAD -sum of absolute differences-, for same number of retained coefficients
   %  "xc", in the three block scanning nethods
   %  -implement matrix quantization for I
   % and P as defined in the class-notes and define the quantization/reverse quantization module for the encoder.
   
   
   A = im2double(imread('rice.png'));
    
    block_size = 8;
    
    %define the zig zag scanning matrix
    zigzagScan = [0 1 5 6 14 15 27 28; ...
                  2 4 7 13 16 26 29 42;...
                  3 8 12 17 25 30 41 43;...
                  9 11 18 24 31 40 44 53;...
                  10 19 23 32 39 45 52 54; ...
                  20 22 33 38 46 51 55 60;...
                  21 34 37 47 50 56 59 61;...
                  35 36 48 49 57 58 62 63;];
    % retain the most important "xc" coefficients by creating the
    % quantization mask
    xc= 10;
    impMatrix = ones(block_size).*(zigzagScan<10);
    
    [height width] = size(A);
    Dblock = dctmtx(block_size);
    A_transf = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
             % apply DCT block by block
            block = A(i:i+block_size-1, j:j+block_size-1);
            dct_block = Dblock*block*Dblock';
             % quantify the transformed block by keeping the most important xc coefficients
             % fill in the missing code
             qdct_block= dct_block.*impMatrix;
            A_transf(i:i+block_size-1, j:j+block_size-1) = qdct_block;
        end
    end
    figure(4), imshow(A_transf)
    
    
    % apply the inverse DCT block by block and store the result in the A_rec matrix
    A_rec = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
            block = A_transf(i:i+block_size-1, j:j+block_size-1);
            dct_block = Dblock'*block*Dblock;
            A_rec(i:i+block_size-1, j:j+block_size-1) = dct_block;
        end
    end
    
    % SAD 
    sad = sum(sum(abs(A - A_rec)))
    figure(5), imshow(A - A_rec)
    figure(6), imshow(A_rec)