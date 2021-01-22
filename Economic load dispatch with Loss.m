%ECONOMIC LOAD DISPATCH(with loss).
%LAMBDA ITERATION METHOD.
clc;
clear  all;
ip=fopen('loss_data.m','r');
data=fscanf(ip,'%f',[6,3]);
data=data';
const=data(:,1);
beta=data(:,2);
gamma=data(:,3);
pmin=data(:,4);
pmax=data(:,5);
ploss=data(:,6);
lambda=input('Enter the assumed value of lambda : \n');
p=zeros(3,1);
loss=0;
demand=input('Enter the demand(MW): \n');
deltap=1;
iteration=0;
while abs(deltap)>.0001
    iteration=iteration+1;
for i=1:3
    p(i)=(lambda-beta(i))/(2*[gamma(i)+lambda*ploss(i)]);
    loss=loss+ploss(i)*p(i)^2;
end

end
    deltalambda=deltap/k;
lambda=lambda+deltalambda;
end
disp(p);%optimal dispatch of generation in MW
disp(iteration);%number of iterations
disp(lambda);%incremental cost of delivered power in $/MWh(system lambda)

