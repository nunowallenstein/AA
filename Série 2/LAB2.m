quad1ini
eta_v=[0.001 0.01 0.03 0.1 0.3 1 3]
a_v=[0.5 1 2 5]
n_M=zeros(length(eta_v),length(a_v));
DIV_M=zeros(length(eta_v),length(a_v));
f_M=zeros(length(eta_v),length(a_v));
for j=1:length(a_v)
for i=1:length(eta_v)
[n_M(i,j),DIV_M(i,j),f_M(i,j)]=quad1(a_v(j),eta_v(i));
end
end
n_M
DIV_M
f_M