-- extract pmids from W for one-time PCOR analysis
SELECT
  DISTINCT el_from AS page_id,
  REGEXP_REPLACE(el_to, '.+?(=|/)(\\d+).*', '\\2') AS pmid,
  now() AS dt
FROM
  externallinks
WHERE
  el_from IN (
    SELECT
      page_id
    FROM
      page
    WHERE
      page_namespace = 0
  )
  AND (
    lower(el_to) REGEXP '.*ncbi.*(=|/)pubmed'
    OR lower(el_to) REGEXP 'pubmed\.gov'
  )
  AND el_to REGEXP '(=|/)\\d{4,}'
