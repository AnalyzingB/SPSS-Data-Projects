* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=gender age
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=gender age q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 
    q20 q21 q22 q23 q24 q25 q26
  /ORDER=ANALYSIS.

RECODE q1 (1=1) (2=1) (3=2) (4=2) (5=3) (6=3) (7=4) (8=4) (9=5) (10=5) INTO Q1Coded.
VARIABLE LABELS  Q1Coded 'Combined Scale'.
EXECUTE.

SORT CASES  BY gender.
SPLIT FILE LAYERED BY gender.

FREQUENCIES VARIABLES=Q1Coded Q2Coded Q3Coded Q4Coded Q5Coded Q6Coded Q7Coded Q8Coded Q9Coded 
    Q10Coded Q11Coded Q12Coded Q13Coded Q14Coded Q15Coded Q16Coded Q17Coded Q18Coded Q19Coded Q20Coded 
    Q21Coded Q22Coded Q23Coded Q24Coded Q25Coded Q26Coded
  /ORDER=ANALYSIS.

RECODE age (1=SYSMIS) (2=SYSMIS) (3=SYSMIS) (12=SYSMIS) (13=SYSMIS) (18 thru 24=1) (25 thru 34=2) 
    (35 thru 44=3) (45 thru 54=4) (55 thru 64=5) INTO AgeBand.
EXECUTE.

SPLIT FILE OFF.

FREQUENCIES VARIABLES=AgeBand
  /ORDER=ANALYSIS.


SORT CASES  BY AgeBand.
SPLIT FILE LAYERED BY AgeBand.

FREQUENCIES VARIABLES=Q1Coded Q2Coded Q3Coded Q4Coded Q5Coded Q6Coded Q7Coded Q8Coded Q9Coded 
    Q10Coded Q11Coded Q12Coded Q13Coded Q14Coded Q15Coded Q16Coded Q17Coded Q18Coded Q19Coded Q20Coded 
    Q21Coded Q22Coded Q23Coded Q24Coded Q25Coded Q26Coded
  /ORDER=ANALYSIS.

SORT CASES  BY gender AgeBand.
SPLIT FILE LAYERED BY gender AgeBand.

FREQUENCIES VARIABLES=Q1Coded Q2Coded Q3Coded Q4Coded Q5Coded Q6Coded Q7Coded Q8Coded Q9Coded 
    Q10Coded Q11Coded Q12Coded Q13Coded Q14Coded Q15Coded Q16Coded Q17Coded Q18Coded Q19Coded Q20Coded 
    Q21Coded Q22Coded Q23Coded Q24Coded Q25Coded Q26Coded
  /ORDER=ANALYSIS.
