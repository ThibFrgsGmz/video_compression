function transform()

   A = im2double(imread('rice.png'));
   % Discrete Cosine Tranform 
   D = dctmtx(size(A,1));
   % Apply DCT on the entire image
   dct = D*A*D';
   figure(1), imshow(dct)
   % Inverse DCT transform
   rec = D'*dct*D;
   figure(2), imshow(rec)
   figure(3), imshow(A)
   

    % apply DCT block by block and store the result in the A_transf matrix
    block_size = 8;
    [height width] = size(A);
    Dblock = dctmtx(block_size);
    A_transf = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
           current_block = A(i:i+block_size-1,j:j+block_size-1);
           block_transform= Dblock*current_block*Dblock';
           A_transf(i:i+block_size-1,j:j+block_size-1)= block_transform;
        end
    end
    figure(4), imshow(A_transf)
    % apply the inverse DCT block by block and store the result in the A_rec matrix
      
  block_size = 8;
 [height width] = size(A);
 Dblock = dctmtx(block_size);
  A_rec = zeros(size(A))
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
           current_block = A(i:i+block_size-1,j:j+block_size-1);
           block_transform= Dblock*current_block*Dblock;
           A_rec(i:i+block_size-1,j:j+block_size-1)= block_transform;
        end
    end
    figure(5), imshow(A_rec)