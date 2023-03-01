function performance = performanceFn(mse,R)
    performance = (1 - R*R) + mse;
end