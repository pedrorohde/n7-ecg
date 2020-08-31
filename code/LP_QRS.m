function y = LP_QRS(x)
    
    B = conv([1,0,0,0,0,0,-1],[1,0,0,0,0,0,-1]);
    A = conv([1,-1], [1,-1]);
    
    y = filter(B,A,x);
    
end