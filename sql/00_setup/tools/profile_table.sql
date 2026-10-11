-- =====================================================================
-- tools/profile_table.sql   — a reusable "column sniffer" for ANY imported table
-- Run this ONCE per database (Alt+X). Then use it on any table:
--
--     SELECT * FROM public.profile_table('raw', 'olist_orders_dataset');
--
-- For every column it tells you: rows, empty/NULL count, distinct values,
-- longest value, and a SUGGESTED data type based on what the values look like.
-- Use the suggestion when you write your raw -> clean conversion script.
-- (Always eyeball it: "01/02/2018" is text here — is that dd/mm or mm/dd?)
-- =====================================================================
CREATE OR REPLACE FUNCTION public.profile_table(p_schema text, p_table text)
RETURNS TABLE (column_name text, n_rows bigint, n_empty_or_null bigint,
               n_distinct bigint, max_length integer, suggested_type text)
LANGUAGE plpgsql AS
$f$
DECLARE
    r record;
    q text;
BEGIN
    FOR r IN
        SELECT c.column_name AS cn
        FROM information_schema.columns c
        WHERE c.table_schema = p_schema AND c.table_name = p_table
        ORDER BY c.ordinal_position
    LOOP
        q := format($q$
            SELECT %L::text,
                   COUNT(*),
                   COUNT(*) FILTER (WHERE NULLIF(trim(%I::text), '') IS NULL),
                   COUNT(DISTINCT %I),
                   MAX(length(%I::text))::integer,
                   CASE
                     WHEN COUNT(*) FILTER (WHERE NULLIF(trim(%I::text), '') IS NOT NULL) = 0
                          THEN 'text (all empty)'
                     WHEN COUNT(*) FILTER (WHERE NULLIF(trim(%I::text), '') IS NOT NULL
                                             AND %I::text !~ '^-?\d+$') = 0
                          THEN 'integer / bigint'
                     WHEN COUNT(*) FILTER (WHERE NULLIF(trim(%I::text), '') IS NOT NULL
                                             AND %I::text !~ '^-?\d+(\.\d+)?$') = 0
                          THEN 'numeric'
                     WHEN COUNT(*) FILTER (WHERE NULLIF(trim(%I::text), '') IS NOT NULL
                                             AND %I::text !~ '^\d{4}-\d{2}-\d{2}([ T]\d{2}:\d{2}(:\d{2}(\.\d+)?)?)?$') = 0
                          THEN 'timestamp / date'
                     ELSE 'text'
                   END
            FROM %I.%I $q$,
            r.cn, r.cn, r.cn, r.cn, r.cn, r.cn, r.cn, r.cn, r.cn, r.cn, r.cn,
            p_schema, p_table);
        RETURN QUERY EXECUTE q;
    END LOOP;
END
$f$;
