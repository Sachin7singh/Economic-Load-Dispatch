clc;
clear  all;
n =input('Enter Number of Units:\n');
fprintf('Cost function is taken of the form Ci=ai+bi*Pi+gi*Pi*Pi \n');
for i=1:n
    fprintf('for unit no %d,',i);
    a(i)=input('Enter the alpha value:');
    b(i)=input('Enter the beta value:');
    g(i)=input('Enter the gamma value:');
end
l=input('Value of lambda: \n');
p = zeros(n,1);
Pd=input('Enter the load demand : \n');
dP=1;
itr=0;

C=[];
while abs(dP)>.0001
    itr=itr+1;
    TC=0;
    for i=1:n
      p(i)=(l-b(i))/(2*g(i));
      TC=TC+(a(i)+b(i)*p(i)+g(i)*(p(i)^2));
    end
    dP=Pd-sum(p);
  if abs(dP)>0
    k=0;
    for i=1:n
      k=k+(1/(2*g(i)));
    end
  end
  dl=dP/k;
  l=l+dl;
  C(itr)=TC;
end
fprintf('Total cost is Rs %.4f' ,TC);
disp(p);
disp(itr);
disp(l);
figure;
i=1:itr;
plot(i,C(i));
title('Convergence plot');
xlabel('No. of iterations');
ylabel('Total cost at each iteration');
hold on;