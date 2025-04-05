CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE offset_value INT;
    SET offset_value = N - 1;
    RETURN (
        # Write your MySQL query statement below.
        select distinct(salary)
        from employee
        order by salary desc
        limit 1 offset offset_value
  );
END