
load ('data1.mat')

% Alocamos os termos da primeira variavel na respectiva classe.
X1_1=xtrain(1,1:50) 
X1_2=xtrain(1,51:100)
X1_3=xtrain(1,101:150)

% Alocarmos os termos da segunda variavel na respectiva classe.
X2_1=xtrain(2,1:50)
X2_2=xtrain(2,51:100)
X2_3=xtrain(2,101:150)

% De seguida é calculada a variância e a média de cada termo.
V1_1=var(X1_1)
V1_2=var(X1_2)
V1_3=var(X1_3)
V2_1=var(X2_1)
V2_2=var(X2_2)
V2_3=var(X2_3)

% Média 
M1_1=mean(X1_1)
M1_2=mean(X1_2)
M1_3=mean(X1_3)
M2_1=mean(X2_1)
M2_2=mean(X2_2)
M2_3=mean(X2_3)

%De seguida vamos calcular as funções de distribuição do testdata
x1=xtest(1,1:150)
x2=xtest(2,1:150)
f1_1=(1/((V1_1*2*pi).^(1/2)))*exp(-1*(((x1-M1_1).^2)/V1_1)/2)
f1_2=(1/((V1_2*2*pi).^(1/2)))*exp(-1*(((x1-M1_2).^2)/V1_2)/2)
f1_3=(1/((V1_3*2*pi).^(1/2)))*exp(-1*(((x1-M1_3).^2)/V1_3)/2)
f2_1=(1/((V2_1*2*pi).^(1/2)))*exp(-1*(((x2-M2_1).^2)/V2_1)/2)
f2_2=(1/((V2_2*2*pi).^(1/2)))*exp(-1*(((x2-M2_2).^2)/V2_2)/2)
f2_3=(1/((V2_3*2*pi).^(1/2)))*exp(-1*(((x2-M2_3).^2)/V2_3)/2)
%O ciclo seguinte da-nos o resultado da probabilidade de dada uma classe o
%nosso input pertencer a essa classe
for i=1:150
score1(i)=f1_1(i)*f2_1(i);
score2(i)=f1_2(i)*f2_2(i);
score3(i)=f1_3(i)*f2_3(i);

%este ciclo seleciona qual foi o maior valor do score, e associa essa valor
%a uma classe, classe 1, 2 e 3
if (max([score1(i) score2(i) score3(i)])==score1(i))
    k=1;
end
    if (max([score1(i) score2(i) score3(i)])==score2(i))
    k=2;
    end
    if (max([score1(i) score2(i) score3(i)])==score3(i))
    k=3;
    end
    score4(i)=k;
    score5(i)=max([score1(i) score2(i) score3(i)]);
end
%o ciclo seguinte cria um vector com 0 e 1, sendo 1 se o input foi bem
%classificado, e 0 se foi mal classificado
erro=zeros(1,150);

for i=1:150    
    if score4(i)==ytest(i)
        erro(i)= 1
    else
        erro(i)=0   
   
    end
end
%este ciclo calcula o total de inputs mal classificados
s=0
for i=1:150
    if erro(i)==0
        s=s+1
    end
end
% error dá-nos o valor do erro associado ao input(xest). Temos o valor
% predito pelo modelo e o valor que deveria-mos obter, e com isso
% calculamos o erro
error=((s)/150)*100
index=(1:150)
PlTeste=scatter(index,score4)
PlTeste.MarkerEdgeColor=[1 0 0]
legend('Test Pattern Classification')

