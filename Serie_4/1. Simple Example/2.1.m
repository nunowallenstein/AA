load data1.mat
P1=scatter(xtrain(1,1:50),xtrain(2,1:50))
hold on
P2=scatter(xtrain(1,51:100),xtrain(2,51:100))
hold on
P3=scatter(xtrain(1,101:150),xtrain(2,101:150))
hold on
P4=scatter(xtest(1,1:50),xtest(2,1:50))
hold on
P5=scatter(xtest(1,51:100),xtest(2,51:100))
hold on
P6=scatter(xtest(1,101:150),xtest(2,101:150))
hold off
P1.MarkerEdgeColor=[1 0 0]
P2.MarkerEdgeColor=[0 1 0]
P3.MarkerEdgeColor=[0 0 1]
P4.MarkerEdgeColor=[1 1 0]
P5.MarkerEdgeColor=[1 0 1]
P6.MarkerEdgeColor=[0 1 1]
legend('Trainclass1','Trainclass2','Trainclass3','Testclass1','TestClass2','TestClass3')
