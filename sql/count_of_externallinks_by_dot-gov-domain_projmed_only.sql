-- count of ext links by .gov domains for pages in WP:M
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
      page2.page_id
    FROM
      page
      INNER JOIN page page2 ON page.page_title = page2.page_title
      INNER JOIN categorylinks ON cl_from = page.page_id
      AND categorylinks.cl_to = "All_WikiProject_Medicine_articles"
    WHERE
      page.page_namespace = 1
      AND page2.page_namespace = 0
  )
AND LOWER(REGEXP_REPLACE(el_to, @hostname_regex, '\\3')) LIKE '%.gov'
GROUP BY domain
ORDER BY num_links desc;
