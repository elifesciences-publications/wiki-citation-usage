-- count of Ext links per domain/hostname for pages in WP:M
SET @domain_regex = '^([^:/?#]+:)?(\/+([^/?#]*))?([^\?#]*)\?.*';
SELECT
  LOWER(REGEXP_REPLACE(el_to, @domain_regex, '\\3')) as domain,
  count(distinct el_from, el_to) as num_links
from
  externallinks
where
  el_from in (
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
group by
  LOWER(REGEXP_REPLACE(el_to, @domain_regex, '\\3'))
order by
  count(*) desc
limit 1000;

