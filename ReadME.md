Primary Key: one or more columns that can be used as unique identifier for each row in a table

Foreign Key: one or more columns that can be used together to identify a single row in another table

-----------
The order of operation in sql:
1. `FROM`
2. `JOIN`
3. `WHERE`
      - filter rows
4. `GROUP BY`
5. `HAVING`
      - filter groups
6. `SELECT`
7. `ORDER BY`

-------

### Locking

- used to control simultaneous use of data resources.
- There are 2 locking strategies:
  1. **Database writers** must request and receive from the server a `write lock` to modify data, and **Database readers** must request and receive from the server a `read lock` to query the data, `read request are blocked until the write lock is released`

  2. **Database writers** must request and receive from the server a `write lock` to modify data, and **Database readers** do not need any type of lock to query data, instead the server ensures that a reader sees a consistent view of the data from the time the query start until the query finishes. (versioning).

---------
- Shard Lock