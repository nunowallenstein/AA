quad2ini
eta_v=[0.09]
a_v=[20 ]
n_M=zeros(length(eta_v),length(a_v));
DIV_M=zeros(length(eta_v),length(a_v));
f_M=zeros(length(eta_v),length(a_v));
for j=1:length(a_v)
for i=1:length(eta_v)
[n_M(i,j),f_M(i,j)]=quad2(a_v(j),eta_v(i));
end
end
n_M
DIV_M
f_M