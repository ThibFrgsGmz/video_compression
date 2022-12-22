function [codebin,code,dictionnaire] = entropycoder(coeffdctquant)

vectcoeff = coeffdctquant(:);
unqvect=unique(vectcoeff);

countElvect=histc(vectcoeff,unqvect); 
relFreq=countElvect/numel(vectcoeff);

symbols = 1: numel(relFreq);

dict = huffmandict(symbols,relFreq);

comp = huffmanenco(sig,dict);

code= comp;
codebin = comp;
dictionnaire = dict;