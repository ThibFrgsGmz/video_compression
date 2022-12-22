function [bts,imgRec] = spatialencoder(img,block_size, Q)

coeffsdct = directDCT(img,block_size);
[bts,coeffsq] = DirectQuantification(coeffsdct,Q);


% [codebin, code,dictionnaire] = entropycoder(coeffsq);
% 
% coeffdecodeentropy = huffmandeco(code,dictionnaire);
%il suffit de remplacer coeffsq par coeffdecodeentropy pour faire la suite du decodage s on souhaite utilisé le code de huffman
%
%Puis de retourner un variable dans laquelle on retrouvera le code binaire afin de voir qu'elle code a été généré .


coeffsqin = InverseQuantification(coeffsq,Q);
imgRec= directDCTinversetransf(coeffsqin,block_size);




