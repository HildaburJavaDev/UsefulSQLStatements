column_list VARCHAR2(4000);
sql_query   VARCHAR2(4000);
BEGIN
SELECT LISTAGG('''' || element_name || ''' AS "' || element_name || '"', ', ')
INTO column_list
FROM (SELECT DISTINCT element_name FROM L2.V_TEST order by element_name asc);

sql_query := 'SELECT * FROM (
SELECT analysis_id,element_name, analysis_value
FROM L2.V_TEST
)
PIVOT (
max(analysis_id)
FOR element_name IN (' || column_list || ')
)';

EXECUTE IMMEDIATE sql_query;
END;
