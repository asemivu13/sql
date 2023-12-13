# recursive sql
select 1;

with recursive cte_count (n)
as (
	# base case
	select 1
    
    union all
    
    # recursive case
    select n+1
    from cte_count
    # termination condition
    where n < 3
)
select n from cte_count;