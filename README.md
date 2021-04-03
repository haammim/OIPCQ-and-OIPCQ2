# OIPCQ-and-OIPCQ2

These codes and outputs are related to "An Order Independent Algorithm for Inferring Gene Regulatory Network Using Quantile Value for Conditional Independent Tests".

OIPCQ requires the functions of cmi and Compare, and OIPCQ2 requires the functions of cmi and MI2 and Compare.

In the DREAM3, DREAM4 and SOS-DATA data, the columns represent the genes and the rows represent the different samples. Since we compute the dependency criterion of Mutual Information on rows we first calculate the transposed of this data.
For AML data there is no need to transpose because the rows represent the genes and the transcription factors and the columns represent the different samples.
In OIPC and OIPC, data22 takes the data of DREAM3 and DREAM4 then calculates the transpose in the next line.
For AML data in both algorithms, you need to remove these two lines and use the next line without the comment.

To obtain the outputs mentioned in the article, we need to use a specific treshold for each method and dataset.
We consider the RACER network as a Golden Standard Network for the AML dataset.
We set the seventy percentile for all methods and datasets (psi1=psi2=70).
The following are listed separately for each method and dataset:

OIPCQ based on cmi:
DREAM3:
for 10 Genes: theta0=0.1 & theta=0.01
for 50 Genes: theta0=0.02 & theta=0.05
for 100 Genes: theta0=0.03 & theta=0.05
DREAM4:
for NET 1: theta0=0.06 & theta=0.01
for NET 2: theta0=0.02 & theta=0.03
for NET 3: theta0=0.05 & theta=0.04
for NET 4: theta0=0.02 & theta=0.05
for NET 5: theta0=0.08 & theta=0.06
SOS_DNA:
theta0=0.01 & theta=0.01
AML:
theta0=0.01 & theta=0.01



OIPCQ2 based on cmi2:
DREAM3:
for 10 Genes: theta0=0.1 & theta=0.01
for 50 Genes: theta0=0.02 & theta=0.08
for 100 Genes: theta0=0.03 & theta=0.06
DREAM4:
for NET 1: theta0=0.06 & theta=0.02
for NET 2: theta0=0.01 & theta=0.03
for NET 3: theta0=0.05 & theta=0.05
for NET 4: theta0=0.02 & theta=0.06
for NET 5: theta0=0.06 & theta=0.09
SOS_DNA:
theta0=0.01 & theta=0.01
AML:
theta0=0.01 & theta=0.01
