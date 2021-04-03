data22=load('Dream3_10.txt');
data=data22';

TrueNet=load('TrueNetwork3_10.txt');
TrueNetUper=triu(TrueNet,1);

UndirectCompareFinal=["theta0", 'theta', 'psi', 'TP', 'FP', 'TN', 'FN', 'PPV', 'TPR', 'ACC', 'F', 'TNR', 'FNR', 'FPR', 'NPV', 'FDR', 'MCC'];

theta0=0.1;
theta=0.01;
psi=70;

n_gene=size(data,1);

G=ones(n_gene,n_gene);
G=tril(G,-1)';

Gval={};

nn=size(G,1);

UndirectCompare=[];


for orderr=1:3
    if orderr==1
        for i=1:nn-1
            for j=i+1:nn
                Gval{1,orderr}{i,j}=cmi(data(i,:),data(j,:));
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if Gval{1,1}{i,j}<theta0
                    G(i,j)=0;
                end
            end
        end
        
    elseif orderr==2
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                    for k=1:nn
                        if k~=i && k~=j
                            if G(i,k)==1 || G(k,i)==1
                                if G(j,k)==1 || G(k,j)==1
                                    Gval{1,orderr}{i,j}{1,k}=cmi(data(i,:), data(j,:), data(k,:));
                                end
                            end
                        end
                    end
                end
            end
        end
        prc=[];
        for i=1:nn-1
            for j=i+1:nn
                Vecqnt=[];
                if G(i,j)==1
                    for k=1:nn
                        if k~=i && k~=j
                            if G(i,k)==1 || G(k,i)==1
                                if G(j,k)==1 || G(k,j)==1
                                    Vecqnt=[Vecqnt, Gval{1,2}{i,j}{1,k}];
                                end
                            end
                        end
                    end
                end
                prc(i,j)=prctile(Vecqnt, psi);
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if prc(i,j)<theta
                    G(i,j)=0;
                end
            end
        end
        
    else
        for i=1:nn-1
            for j=i+1:nn
                if G(i,j)==1
                    for k=1:nn-1
                        if k~=i && k~=j
                            for l=k+1:nn
                                if l~=i && l~=j
                                    if G(i,k)==1 || G(k,i)==1 || G(j,k)==1 || G(k,j)==1
                                        if G(i,l)==1 || G(l,i)==1 || G(j,l)==1 || G(l,j)==1
                                            Gval{1,orderr}{i,j}{1,k}{1,l}=cmi(data(i,:), data(j,:), data([k,l],:));
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        prc=[];
        for i=1:nn-1
            for j=i+1:nn
                Vecqnt=[];
                if G(i,j)==1
                    for k=1:nn
                        for l=k+1:nn
                            if k~=i && k~=j && l~=i && l~=j
                                if G(i,k)==1 || G(k,i)==1 || G(j,k)==1 || G(k,j)==1
                                    if G(i,l)==1 || G(l,i)==1 || G(j,l)==1 || G(l,j)==1
                                        Vecqnt=[Vecqnt, Gval{1,3}{i,j}{1,k}{1,l}];
                                    end
                                end
                            end
                        end
                    end
                end
                prc(i,j)=prctile(Vecqnt, psi);
            end
        end
        for i=1:nn-1
            for j=i+1:nn
                if prc(i,j)<theta
                    G(i,j)=0;
                end
            end
        end
    end
    
end

% *************************************************************************
% This section should be use for AML dataset
% *************************************************************************

%     for i=1:size(targets,1)-1
%         for j=i+1:size(targets,1)
%             G(targets(i,1),targets(j,1))=0;
%             G(targets(j,1),targets(i,1))=0;
%         end
%     end

% *************************************************************************
% END
% *************************************************************************

UndirectCompare=Compare(TrueNetUper,G,nn);
UndirectCompare=[theta0, theta, psi, UndirectCompare];
UndirectCompareFinal=[UndirectCompareFinal; UndirectCompare];
