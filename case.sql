use classicmodels;

select status,
	case status
		when 'Shipped' then 'This is shipped'
        when 'Cancelled' then 'This is processing'
	end as status_text
from orders;