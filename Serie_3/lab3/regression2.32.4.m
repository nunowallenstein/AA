load regression_data

X
T
W=zeros(15,1);

m_1=zeros(2/0.01+1,1)
for(i=1:length(m_1))
    m_1(i,1)=-1+0.01*(i-1)
end

for(i=1:15)
    W(i)=X(i+84);
    
end
W1=transpose(W);  
X1=transpose(m_1);
net.performFcn='mse';
net = fitnet(20);
net.layers{1}.transferFcn='tansig';
net.layers{2}.transferFcn='purelin';
net.divideFcn='divideind';
net.divideParam.trainInd=1:70;
net.divideParam.testInd=71:85;
net.divideParam.valInd=86:100;
net.trainFcn = 'trainlm';
net.trainParam.lr=0.01; % learning rate
net.trainParam.show=3000; % # of epochs in display
net.trainParam.epochs=3000; 
net.trainParam.goal=0.005;
[net,tr] = train(net,X,T);
y=net(X)
S1=scatter(X,y)
hold on
y2=net(W1)
S2=scatter(W1,y2)
y3=net(X1)
S3=plot(X1,y3)
S1.MarkerEdgeColor=[1 0 0];
S2.MarkerEdgeColor=[0 1 0];
S3.MarkerEdgeColor=[0 0 1];
legend('Training data','Test data','Function');
%legend('show');
%legend('train','teste','function')
hold off