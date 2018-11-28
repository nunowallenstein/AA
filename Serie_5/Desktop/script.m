 
load('spiral.mat')
opt=statset('maxIter',200000);
a=svmtrain(X,Y,'boxconstraint',10000,'kernel_function','polynomial','method','SMO','polyorder',12,'showplot',true,'options',opt);
%a=svmtrain(X,Y,'boxconstraint',10000,'kernel_function','rbf','method','SMO','rbf_sigma',1,'showplot',true,'options',opt);
accuracy=sum(svmclassify(a,X)==Y)/length(Y)*100;
100-accuracy