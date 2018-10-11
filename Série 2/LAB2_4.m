rosenini
assact

eta_v=[0.001 0.01 0.1 1 10]
alfa_v=[0 0.5 0.7 0.9 0.95 0.99]
n_M=zeros(length(eta_v),length(alfa_v));
DIV_M=zeros(length(eta_v),length(alfa_v));
f_M=zeros(length(eta_v),length(alfa_v));
for j=1:length(alfa_v)
for i=1:length(eta_v)
[n_M(i,j),DIV_M(i,j),f_M(i,j)]=rosen(alfa_v(j),eta_v(i));
end
end
n_M
DIV_M
f_M