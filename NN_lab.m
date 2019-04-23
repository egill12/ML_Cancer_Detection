K = 30
q = 0.7
A = [rand(1,K)-q; rand(1,K)+ q];
B = [rand(1,K)+q; rand(1,K)+ q];
C = [rand(1,K)-q; rand(1,K)- q];
D = [rand(1,K)+q; rand(1,K)- q];

plot(A(1,:),A(2,:),"bs")
hold on
grid on
plot(B(1,:),B(2,:),"r+")
plot(C(1,:),C(2,:),"go")
plot(D(1,:),D(2,:),"m*")

a = [0 1]'; % ' gives us the transpose
b = [1 1]';
c = [1 0]';
d = [0 0]';

P = [A B C D] % this acts as the input data
% T specifies the target, i.e. Y
T = [repmat(a,1,length(A)) repmat(b,1,length(B)) repmat(c,1,length(C)) repmat(d,1,length(D))];
% initialise the NN
% 
E = 1;
net.adaptParam.passes = 1;
linehandle = plotpc(net.IW{1},net.b{1});
n = 0;
while (sse(E) & n<1000)
n = n+1;
[net,Y,E] = adapt(net,P,T);
linehandle = plotpc(net.IW{1},net.b{1},linehandle);
drawnow;
end
    