-- count of ext links by top level domain for pages in W
SET @tld_regex = '.+(\\.[^\\.]+)$';
SET @hostname_regex = '^([^:/?#]+:)?(\/+([^/?#:]*))?([^\?#]*)\?.*';

SELECT
LOWER(REGEXP_REPLACE(LOWER(REGEXP_REPLACE(el_to, @hostname_regex, '\\3')), @tld_regex, '\\1')) as tld,
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
GROUP BY tld
ORDER BY num_links desc
;
