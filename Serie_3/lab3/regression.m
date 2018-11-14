load regression_data

X
T
%X1=transpose(m_1);
net.performFcn='mse';
net = fitnet(20);
%net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='purelin';
net.divideFcn='divideind';
net.divideParam.trainInd=1:85;
net.divideParam.testInd=86:100;
%net.divideParam.valInd=86:100;
net.trainFcn = 'trainlm';
net.trainParam.lr=0.01; % learning rate
net.trainParam.show=3000; % # of epochs in display
net.trainParam.epochs=3000; 
net.trainParam.goal=0.005;
[net,tr] = train(net,X,T);

