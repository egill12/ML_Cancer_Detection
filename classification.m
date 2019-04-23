% load data
[x,t] = crab_dataset; % x = features, t = target

net = feedforwardnet(10);
net.trainParam.epochs = 100; % max. epochs/iterations
net.trainparam.lr = 0.3; % learning rate
net.trainParam.mc = 0.6; % momentum constant
[net,tr] = train(net,x,t); % network training

% retrieve the patterns that were sampled as testing patterns
testX = x(:,tr.testInd);
testT = t(:,tr.testInd);
% test classifier on the new data
testY = net(testX); % predictions
testIndices = vec2ind(testY) 

% confusion plots
plotconfusion(testT,testY)
[c,cm] = confusion(testT,testY)
fprintf('Percentage Correct Classification : %f%%\n', 100*(1-c));
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c);
