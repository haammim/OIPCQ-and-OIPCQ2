# OIPCQ-and-OIPCQ2

These codes and outputs are related to "An Order Independent Algorithm for Inferring Gene Regulatory Network Using Quantile Value for Conditional Independent Tests".

OIPCQ requires the functions of cmi and Compare, and OIPCQ2 requires the functions of cmi and MI2 and Compare.

To obtain the outputs mentioned in the article, we need to use a specific treshold for each method and dataset.
We consider the RACER network as a Golden Standard Network for the AML dataset.
We set the seventy percentile for all methods and datasets (psi1=psi2=70).
The following are listed separately for each method and dataset:

OIPC:
DREAM3:
for 10 Genes: theta0=0.1 & theta1=0.01 & theta2=0.01
for 50 Genes: theta0=0.016 & theta1=0.05 & theta2=0.05
for 100 Genes: theta0=0.033 & theta1=0.05 & theta2=0.05
DREAM4:
for NET 1: theta0=0.06 & theta1=0.015 & theta2=0.015
for NET 2: theta0=0.02 & theta1=0.03 & theta2=0.03
for NET 3: theta0=0.052 & theta1=0.04 & theta2=0.04
for NET 4: theta0=0.02 & theta1=0.05 & theta2=0.05
for NET 5: theta0=0.08 & theta1=0.06 & theta2=0.06
SOS_DNA:
theta0=0.008 & theta1=0.01 & theta2=0.01
AML:
theta0=0.008 & theta1=0.008 & theta2=0.008



OIPC2:
DREAM3:
for 10 Genes: theta0=0.1 & theta1=0.01 & theta2=0.01
for 50 Genes: theta0=0.016 & theta1=0.075 & theta2=0.075
for 100 Genes: theta0=0.031 & theta1=0.064 & theta2=0.064
DREAM4:
for NET 1: theta0=0.059 & theta1=0.025 & theta2=0.025
for NET 2: theta0=0.01 & theta1=0.033 & theta2=0.033
for NET 3: theta0=0.046 & theta1=0.05 & theta2=0.05
for NET 4: theta0=0.02 & theta1=0.06 & theta2=0.06
for NET 5: theta0=0.064 & theta1=0.087 & theta2=0.087
SOS_DNA:
theta0=0.008 & theta1=0.02 & theta2=0.02
AML:
theta0=0.008 & theta1=0.008 & theta2=0.008
