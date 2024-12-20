select * from financial_loan;

/* Total Loan Application */

select count(id) as Total_Loan_Application From financial_loan;

/* MTD Total Loan Application */

select count(id) as MTD_Total_Loan_Application From financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/* PMTD Total Loan Application */

select count(id) as PMTD_Total_Loan_Application From financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;

/* Total Funded Amount */

select SUM(loan_amount) as Total_Funded_Amount From financial_loan;

/* MTD Total Funded Amount */

select SUM(loan_amount) as MTD_Total_Funded_Amount From financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

/* PMTD Total Funded Amount */

select SUM(loan_amount) as PMTD_Total_Funded_Amount from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;

/* Total Received Amount */

select SUM(total_payment) as Total_Received_Amount From financial_loan;

/* MTD Total Received Amount */

select SUM(total_payment) as MTD_Total_Received_Amount From financial_loan
where MONTH(issue_Date) = 12 and YEAR(issue_date) = 2021;

/*  PMTD Total Received Amount */

select SUM(total_payment) as PMTD_Total_Received_Amount From financial_loan
where MONTH(issue_Date) = 11 and YEAR(issue_date) = 2021;

/* Average Interest Rate */

select Round(AVG(int_rate),4) * 100 as Average_interest_rate from financial_loan;

/* MTD Average Interest Rate */

select Round(AVG(int_rate),4)*100 as  MTD_Average_interest_rate from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) =2021;

/* PMTD Average Interest Rate */

select Round(AVG(int_rate),4) * 100 as  PMTD_Average_interest_rate from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) =2021;

/* Average Dti */

select Round(AVG(dti),4) * 100 as Average_dti from financial_loan;

/* MTD Average Dti */

select Round(AVG(dti),4)*100 as  MTD_Average_dti from financial_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) =2021;

/* PMTD Average Interest Rate */

select Round(AVG(dti),4) * 100 as  PMTD_Average_dti from financial_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) =2021;

/* Good  Loan Application Percentage */

select 
	(COUNT(Case when loan_status = 'Fully Paid' OR loan_status = 'Current' then id end) * 100)
	/
	COUNT(id) as Good_loan_application_percentage
	from financial_loan;

/* Good Loan application */

select COUNT(id) as Good_Loan_Application From financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

/* Good Loan Funded Amount */

select SUM(loan_amount) as Good_loan_funded_amount from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

/* Good Loan Received Amount */

select SUM(total_payment) as Good_loan_Received_Amount From financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

/* Bad Loan Application Percentage */

select 
	(COUNT(Case when loan_status = 'Charged Off' then id end) * 100.0)
	/
	COUNT(id)  as Bad_Loan_Application_Percentage
	from financial_loan;

/* Bad Loan Applications */

select COUNT(id) as Bad_Loan_Application From financial_loan
where loan_status = 'Charged Off';

/* Bad Loan Funded Amount */

select SUM(loan_amount) as Bad_Loan_Funded_Amount from financial_loan
where loan_status = 'Charged Off';

/* Bad Loan Received Amount */

select SUM(total_payment) as Bad_Loan_Received_Amount from financial_loan
where loan_status = 'Charged Off';

/* Loan Grade */

select loan_status,
	   count(id) as Total_Loan_Application,
	   sum(total_payment) as Total_Received_amount,
	   sum(loan_amount) as Total_Funded_amount,
	   avg(int_rate * 100) as Interest_rate,
	   avg(dti * 100) as DTI
	   from financial_loan
	   group by loan_status;

select loan_status,
		SUM(total_payment) as MTD_Total_Received_Amount,
		SUM(loan_amount) as MTD_Total_Funded_Amount
	from financial_loan
	where MONTH(issue_date) = 12
	group by loan_status;

/* Monthly Trend by issue Date */

select Month(issue_date) as Month_Number,
	   DATENAME(MONTH,issue_date) as Month_Name,
	   COUNT(id) as Total_Loan_Applications,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
from financial_loan
group by  Month(issue_date), DATENAME(MONTH,issue_date)
order by Month(issue_date);

/* Regional analysis by state */

select address_state,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   group by address_state
	   order by COUNT(id) DESC;

/* Long Term analysis */

select term,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   group by term
	   order by term

/* Employee Length Analysis */

select emp_length,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   group by emp_length
	   order by count(id) desc;

/* Loan Purpose Breakdown */

select purpose,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   group by purpose
	   order by count(id) desc;

/* Home Ownership analysis */

select home_ownership,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   group by home_ownership
	   order by count(id) desc;

select home_ownership,
	   count(id) as Total_Loan_Application,
	   SUM(total_payment) as Total_Received_Amount,
	   SUM(loan_amount) as Total_Funded_Amount
	   from  financial_loan
	   where grade = 'A'
	   group by home_ownership
	   order by count(id) desc;

