-- count of ext links by .gov domains for pages in W
SET @domain_tld_regex = '.+(\\.[^\\.]+\\.[^\\.]+)$';
SET @hostname_regex = '^([^:/?#]+:)?(\/+([^/?#:]*))?([^\?#]*)\?.*';

SELECT
REGEXP_REPLACE(LOWER(REGEXP_REPLACE(el_to, @hostname_regex, '\\3')), @domain_tld_regex, '\\1') as domain,
  count(distinct el_from, el_to) as num_links
FROM
  externallinks
WHERE
  el_from IN (
    SELECT
      DISTINCT page_id
    FROM
      page
    WHERE
      page_namespace = 0
  )
AND LOWER(REGEXP_REPLACE(el_to, @hostname_regex, '\\3')) LIKE '%.gov'
GROUP BY domain
ORDER BY num_links desc
;

