
/** Q1. Suppose 2 births occur per hour at the Banner Hospital on average. 
Calculate the probability of observing a) 4 births in a given hour and b) 
less than or equal to 3 births in a given hour. (30 points)**/

data a;
	n = 4;
	lambda = 2;
	value = pdf('poission', n, lambda);
	put value;
run;

/** part a.
			P(X=4) = .0902 **/

data b;
	n = 3;
	lambda = 2;
	value2 = pdf('poission', n, lambda);
	put value2;
run;
data c;
	n = 2;
	lambda = 2;
	value3 = pdf('poission', n, lambda);
	put value3;
run;
data d;
	n = 1;
	lambda = 2;
	value4 = pdf('poission', n, lambda);
	put value4;
run;
data e;
	n = 0;
	lambda = 2;
	value5 = pdf('poission', n, lambda);
	put value5;
run;

/** part b
		P(X<=3) = P(X=0) P(X=1) P(X=2) P(X=3) = 0.1353 + 
0.2707 + 0.2707 + 0.1804 = .8571 **/

/** Q2. Suppose that the weight of men in America (X) is normally distributed 
with mean µ = 180 lbs, and standard deviation σ = 20 lbs. 
What proportion of men weigh between 160 and 200 lbs? (30 points)**/

/** Z = 160-180/20 Z = -1 
	Z = 200-180/20 Z = 1
	P(-1<Z<1) = P(Z<1) - P(Z<-1)
	P(Z<1) = 0.841
	P(Z<-1) = P(Z >1) = 0.159
	P(-1<Z<1)= 0.841-0.159 = 0.682 **/	

/** Q3. A study is conducted concerning the blood pressure of 50 year old 
women with glaucoma. In the study, n=10 women with glaucoma are randomly selected 
and the sample mean systolic blood pressure is 135 mm Hg and the sample standard 
deviation is 20 mm Hg. Calculate a 95% confidence interval for the true mean systolic 
blood pressure among the population of 50 year old women with glaucoma. (30 points) **/

/** (135 - 2.262(20/√10), 135 + 2.262(20/√10)) 
= (120.69, 149.31) **/


/** Q4. LeukemiaTest1.xlsx and LeukemiaTest2.xlsx contain n=16 
Leukemia samples and their gene X, where “gene1” from LeukemiaTest1.xlsx and 
“gene2” from LeukemiaTest1.xlsx are their gene expression levels before and after 
chemotherapy, respectively. Calculate a difference of the gene expression levels, 
i.e. gene=gene2-gene1, and 95% confidence intervals of the difference. 
Here, the same IDs between the two datasets are the same person. **/


PROC IMPORT datafile = "/home/u62107656/bmi515/homework2/LeukemiaTest1.xlsx"
			out = data1
			DBMS = XLSX
			replace;
run;
PROC IMPORT datafile = "/home/u62107656/bmi515/homework2/LeukemiaTest2.xlsx"
			out = data2
			DBMS = XLSX
			replace;
run;
PROC SORT data= work.data1;
by id;
run; 
DATA merged;
	MERGE data1 data2;
	BY id;
run;
DATA difference;
	set merged;
	diff = gene2 - gene1;
	keep diff id ;
run;
PROC MEANS Data=work.difference  Mean std MaxDec = 2;
VAR diff;
RUN;

/**  From the difference: mean: .34 standard deviation: 1.2443988 **/
/** (.34 + 1.96(1.244/√16), .34 - 1.96(1.244/√16)) 
= (-0.26956, 0.94956)**/

/** Q5. Suppose that we randomly selected 100,000 people in AZ and tested their 
covid-19 infection status. The prevalence, i.e. probability of covid-19 infection, 
was 2%, and its 95% confidence intervals was 1% and 3%. One interpreted that the 
true prevalence of population is between 1% to 3% with 95% probability. 
Do you agree with the interpretation? Otherwise, how to interpret the result? **/

/** Confidence interval pertain to the amount of certainity that an event is 
likely to occur. Probability refers to the likelihood an event will occur. 
The statement given in this question does not make sense because the term 
probability is not used correctly. One can say the true prevalence of covid 
infection status is between 1 and 3 percent with a 95 percent certainity.
 **/
