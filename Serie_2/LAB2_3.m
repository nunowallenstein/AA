quad2ini_mom
eta_v=[0.003 0.01 0.03 0.1 0.3 1 3 10]
alfa_v=[0 0.5 0.7 0.9 0.95]
n_M=zeros(length(eta_v),length(alfa_v));
f_M=zeros(length(eta_v),length(alfa_v));
for j=1:length(alfa_v)
for i=1:length(eta_v)
[n_M(i,j),f_M(i,j)]=quad2_mom(alfa_v(j),eta_v(i));
end
end
n_M
f_M