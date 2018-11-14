function [iter,f]=quad2(a,eta)
global  x1i x2i threshold maxiter alfa;

x2a = (-10:10);

for x1a=-10:10
   z(x1a+11,:) = (a*x1a^2 + x2a.^2) / 2;
end

z = z';

v=10:40:max(max(z));


x1 = x1i;
x2 = x2i;
f = (a*x1^2 + x2^2) / 2;
fold = f;

dx1 = 0;
dx2 = 0;

iter = 0;


x1old = x1;
x2old = x2;
while f > threshold | fold > threshold | isnan(f)
   iter = iter + 1;
   if iter > maxiter, break, end
   dx1 = alfa * dx1 + (1 - alfa) * a*x1;
   dx2 = alfa * dx2 + (1 - alfa) * x2;
   x1 = x1 - eta * dx1;
   x2 = x2 - eta * dx2;
   fold = f;
   f = (a*x1^2 + x2^2) / 2;
   
    x1old = x1;
   x2old = x2;
 
end

if iter <= maxiter
   fprintf('Converged in %d steps, f = %f\n', iter, f)
else
   fprintf('Did not converge in %d steps, f = %g\n', maxiter, f)
end

drawnow
end