% *************************************************************************
% CMI2: Conditional mutual inclusive information(CMI2)
% *************************************************************************
function r_dmi = MI2(x,y,z)
r_dmi = (cas(x,y,z) + cas(y,x,z))/2;
end

% x and y are 1*m dimensional vector; z is n1*m dimensional.
function CS = cas(x,y,z)
% x=rand(10,1)';y=rand(10,1)';z=rand(10,2)';
% x,y,z are row vectors;
n1 = size(z,1);
n = n1 +2;

Cov = cov(x);
Covm = cov([x;y;z]');
Covm1 = cov([x;z]');

InvCov = inv(Cov);
InvCovm = inv(Covm);
InvCovm1 = inv(Covm1);

C11 = InvCovm1(1,1);
C12 = 0;
C13 = InvCovm1(1,2:1+n1);
C23 = InvCovm(2,3:2+n1)-InvCovm(1,2) * (1/(InvCovm(1,1)-InvCovm1(1,1)+InvCov(1,1))) * (InvCovm(1,3:2+n1) - InvCovm1(1,2:1+n1)) ;
C22 = InvCovm(2,2)- InvCovm(1,2)^2 * (1/(InvCovm(1,1)-InvCovm1(1,1)+InvCov(1,1)));
C33 = InvCovm(3:2+n1,3:2+n1)- (1/(InvCovm(1,1)-InvCovm1(1,1)+InvCov(1,1))) * ((InvCovm(1,3:2+n1)-InvCovm1(1,2:1+n1))'*(InvCovm(1,3:2+n1)-InvCovm1(1,2:1+n1)));
InvC = [[C11,C12,C13];[C12,C22,C23];[[C13',C23'],C33]];
% C = inv(InvC);  

C0 = Cov(1,1) * (InvCovm(1,1) - InvCovm1(1,1) + InvCov(1,1));
CS = 0.5 * (trace(InvC*Covm)+log(C0)-n) ;
 
end