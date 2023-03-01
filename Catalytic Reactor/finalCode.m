[x, target] = catalyticReactor();

maxSize = input("Enter maxSize:");

resMinP = 1e7;
resMinPidx = -1;

[Parr, R2, ape, mse, netarr, trarr] = determineHiddenLayerSize(x, target, maxSize);
for i = 1:maxSize
    if(resMinP > Parr(i))
        resMinP = Parr(i);
        resMinPidx = i;
    end
end

disp("Performance value:"); disp(resMinP);
disp("R2 value:"); disp(R2(resMinPidx));
disp("MSE value:"); disp(mse(resMinPidx));
disp("APE value:"); disp(ape(resMinPidx));

network = netarr{resMinPidx};
y = network(x);

figure, plotperform(trarr{resMinPidx});
figure, plottrainstate(trarr{resMinPidx});
figure, plotregression(target, y);

genFunction(network,'myNeuralNetworkFunction');
y = myNeuralNetworkFunction(x);

disp(y);

save('catalyticReactor');