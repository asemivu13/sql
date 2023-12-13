select ascii('A');
select char('65');
select ltrim("     mysql");
select rtrim("mysql      ");
select trim("      mabc       ");
select lower("ABCabc");
select upper("abcAbc");
select reverse("abc");
select length("a");

-- left(text, i) ==> text[:i]
select left("mysql left", 5);
select left("mysql left", 100);
select left("mysql left", 1);

select right("mysql right", 5);
select substring("mysql substring", 7);
select substring("mysql substring", 3, 7);

select repeat("w", 3);
select space(5);
select replace("abc", "ab", "da");
