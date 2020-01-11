function[resultundirect]=Compare(TrueNetUper,G,nn)
TP=0;
FP=0;
TN=0;
FN=0;
for i=1:nn-1
    for j=i+1:nn
        if TrueNetUper(i,j)==1  &&  G(i,j)==1
            TP=TP+1;
        end
    end
end

for i=1:nn-1
    for j=i+1:nn
        if TrueNetUper(i,j)==0  &&  G(i,j)==1
            FP=FP+1;
        end
    end
end

for i=1:nn
    for j=i+1:nn
        if TrueNetUper (i,j)==0   &&   G(i,j)==0
            TN=TN+1;
        end
    end
end

for i=1:nn-1
    for j=i+1:nn
        if TrueNetUper (i,j)==1   &&   G(i,j)==0
            FN=FN+1;
        end
    end
end

%Precision, PPV (Positive Predictive Value)
PPV=TP/(TP+FP);

%Recall, Sensitivity, hit rate, TPR (True Positive Rate)
TPR=TP/(TP+FN);

%Accuracy, ACC
ACC=(TP+TN)/(TP+FP+TN+FN);

%F-measure
F=2*((PPV*TPR)/(PPV+TPR));

%TNR (True Negative Rate), SPC (Specificity)
TNR=TN/(TN+FP);

%FNR (False Negative Rate), Miss Rate
FNR=1-TPR;

%FPR (False Positive Rate), Fall Out
FPR=1-TNR;

%NPV (Negative Predictive Value)
NPV=TN/(TN+FN);

%FDR (False Discovery Rate)
FDR=1-PPV;

%MCC (Matthews Correlation Coefficient)
MCC=((TP*TN)-(FP*FN))/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN)));


resultundirect=[TP,FP,TN,FN,PPV,TPR,ACC,F,TNR,FNR,FPR,NPV,FDR,MCC];
end