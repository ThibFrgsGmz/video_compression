function coeffsFrame=directDCT(frame,block_size)
    
    A = frame;
    [height, width] = size(A);
    Dblock = dctmtx(block_size);
    A_transf = zeros(size(A));
    for i = 1 : block_size: height-block_size + 1 
        for j = 1 : block_size: width-block_size + 1 
           current_block = A(i:i+block_size-1,j:j+block_size-1);
           block_transform= Dblock*current_block*Dblock';
           A_transf(i:i+block_size-1,j:j+block_size-1)= block_transform;
                      
        end
    end
    coeffsFrame = A_transf;





    