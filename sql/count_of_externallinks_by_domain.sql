-- count of Ext links per domain/hostname for pages in W
SET @domain_regex = '^([^:/?#]+:)?(\/+([^/?#]*))?([^\?#]*)\?.*';
SELECT
  LOWER(REGEXP_REPLACE(el_to, @domain_regex, '\\3')) as domain,
  count(distinct el_from, el_to) as num_links
from
  externallinks
where
  el_from in (
    SELECT
      DISTINCT page_id
    from
      page
    WHERE
      page_namespace = 0
  )
group by
  LOWER(REGEXP_REPLACE(el_to, @domain_regex, '\\3'))
order by
  count(*) desc
limit 1000;
