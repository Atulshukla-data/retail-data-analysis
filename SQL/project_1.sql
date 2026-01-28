
use retails_data_project

/* checking for duplicates customer id in table transaction */

select customer_id , count(customer_id) as duplicate_count from Retail_Data_Transactions
group by customer_id
having count (customer_id) > 1

select * from Retail_Data_Transactions
select * from Retail_Data_Response


/* joining two tables using CTE for better understanding the data and to perform cleaning*/


with joined_tables as (
	select trxn.*,
	rspns.response
	from 
	retail_data_transactions as trxn
	left join
	Retail_Data_Response as rspns on trxn.customer_id = rspns.customer_id
)
select * from joined_tables


/* handling null */

with joined_tables as (
	select trxn.*,
	rspns.response
	from 
	retail_data_transactions as trxn
	left join
	Retail_Data_Response as rspns on trxn.customer_id = rspns.customer_id
)
select * from joined_tables
where response is null



select trxn.*,
	rspns.response
	into #joined_table
	from 
	retail_data_transactions as trxn
	left join
	Retail_Data_Response as rspns on trxn.customer_id = rspns.customer_id

	
	delete from #joined_table
	where response is null


select * from #joined_table
select 
count(case when response = 1 then 1 end) as yes_rspns_count
, count( case when response = 0 then 1 end) as no_rspns from #joined_table

/* all over analysis by dividing customers according to their spents*/

WITH customer_summary AS (
    SELECT 
        t.customer_id,
        COUNT(*) AS transaction_count,
        SUM(t.tran_amount) AS total_spent,
        AVG(t.tran_amount) AS avg_transaction,
        COALESCE(r.response, -1) AS response_type
    FROM Retail_Data_Transactions t
    LEFT JOIN Retail_Data_Response r ON t.customer_id = r.customer_id
    GROUP BY t.customer_id, r.response
)
SELECT 
    CASE 
        WHEN total_spent >= 1500 THEN 'High Value (1500+)'
        WHEN total_spent >= 1000 THEN 'Medium-High Value (1000-1499)'
        WHEN total_spent >= 500 THEN 'Medium Value (500-999)'
        ELSE 'Low Value (<500)'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN response_type = 1 THEN 1 ELSE 0 END) AS response_1_count,
    SUM(CASE WHEN response_type = 0 THEN 1 ELSE 0 END) AS response_0_count,
    SUM(CASE WHEN response_type = -1 THEN 1 ELSE 0 END) AS response_null_count,
    ROUND(SUM(CASE WHEN response_type = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS response_rate_percentage,
    AVG(total_spent) AS avg_total_spent,
    AVG(transaction_count) AS avg_transaction_count
FROM customer_summary
GROUP BY 
    CASE 
        WHEN total_spent >= 1500 THEN 'High Value (1500+)'
        WHEN total_spent >= 1000 THEN 'Medium-High Value (1000-1499)'
        WHEN total_spent >= 500 THEN 'Medium Value (500-999)'
        ELSE 'Low Value (<500)'
    END
ORDER BY avg_total_spent DESC


/* High value customers are 15x higher from low value customers in term of response = 1 */

-- top 3 customer by highest trans amount--
SELECT TOP 3
    t.customer_id,
    COUNT(*) AS transaction_count,
    SUM(t.tran_amount) AS total_amount,
    COALESCE(r.response, -1) AS response
FROM Retail_Data_Transactions t
LEFT JOIN Retail_Data_Response r ON t.customer_id = r.customer_id
GROUP BY t.customer_id, r.response
ORDER BY total_amount ASC



--top 3 customers by lowest trans amount--
SELECT TOP 3
    t.customer_id,
    COUNT(*) AS transaction_count,
    SUM(t.tran_amount) AS total_amount,
    COALESCE(r.response, -1) AS response
FROM Retail_Data_Transactions t
LEFT JOIN Retail_Data_Response r ON t.customer_id = r.customer_id
GROUP BY t.customer_id, r.response
ORDER BY total_amount desc
