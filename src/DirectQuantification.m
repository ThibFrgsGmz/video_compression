function [bts, coeffsq] = DirectQuantification(coeffs,Q)
   
    coeffsq = round(coeffs./Q);
    bts = coeffsq;
   
   
    