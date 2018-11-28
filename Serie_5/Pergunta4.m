load('spiral.mat')

a = svmtrain(X,Y,'boxconstraint',10000,'kernel_function','polynomial','method','SMO','polyorder',20 ,'Showplot',true)

svmtrain