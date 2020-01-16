data22=load('Dream3_10.txt');
data=data22';
n_gene=size(data,1);
TrueNet=load('TrueNetwork3_10.txt');
TrueNetUper=triu(TrueNet,1);
UndirectCompareFinal=["theta0", 'theta1', 'psi1', 'theta2', 'psi2', 'TP', 'FP', 'TN', 'FN', 'PPV', 'TPR', 'ACC', 'F', 'TNR', 'FNR', 'FPR', 'NPV', 'FDR', 'MCC'];
theta0=0.1;
theta1=0.01;
theta2=0.01;
psi1=70;
psi2=70;


G=ones(n_gene,n_gene);
G=tril(G,-1)';
Gval={};
nn=size(G,1);
UndirectCompare=[];



for orderr=1:3
    
    order=orderr-1;
    
    if order==0
        for i=1:nn-1
            for j=i+1:nn
                Gval{1,orderr}{i,j}=cmi(data(i,:),data(j,:));
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if Gval{1,orderr}{i,j}<theta0
                    G(i,j)=0;
                end
            end
        end
        
    elseif order==1
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                cmivec=[];
                for k=1:nn
                    if k~=i && k~=j
                        if G(i,k)==1 || G(k,i)==1
                            if G(j,k)==1 || G(k,j)==1
                                cmiv=cmi(data(i,:), data(j,:), data(k,:));
                                cmivec=[cmivec, cmiv];
                            end
                        end
                    end
                end
                Gval{1,orderr}{i,j}=cmivec;
                end
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                    qnt1=prctile(Gval{1,orderr}{i,j},psi1);
                    if qnt1<theta1
                        G(i,j)=0;
                    end
                end
            end
        end
        
    elseif order==2
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                cmivec=[];
                for k=1:nn-1
                    if k~=i && k~=j
                    for l=k+1:nn
                        if l~=i && l~=j
                        if G(i,l)==1 || G(j,l)==1 || G(l,i)==1 || G(l,j)==1
                            if G(i,k)==1 || G(j,k)==1 || G(k,i)==1 || G(k,j)==1
                                cmiv=cmi(data(i,:), data(j,:), data([k,l],:));
                                cmivec=[cmivec, cmiv];
                            end
                        end
                        end
                    end
                    end
                end
                Gval{1,orderr}{i,j}=cmivec;
                end
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                    qnt2=prctile(Gval{1,orderr}{i,j},psi2);
                    if qnt2<theta2
                        G(i,j)=0;
                    end
                end
            end
        end
        
    end
    
end



% *************************************************************************
% This section should be use for AML dataset
% *************************************************************************

% for i=1:size(targets,1)-1
%     for j=i+1:size(targets,1)
%         G(targets(i,1),targets(j,1))=0;
%         G(targets(j,1),targets(i,1))=0;
%     end
% end

% *************************************************************************
% END
% *************************************************************************

UndirectCompare=Compare(TrueNetUper,G,nn);
UndirectCompare=[theta0, theta1, psi1, theta2, psi2, UndirectCompare];
