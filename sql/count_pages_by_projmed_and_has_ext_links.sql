-- Daily count WP:M pages w/ Ext links
-- Daily count WP:M pages w/out Ext links
-- Daily count W pages w/ Ext links
-- Daily count W pages w/out Ext links
select
  "true" as is_proj_med,
  "true" as has_ext_links,
  count(distinct page_id) as distinct_pages
from
  page
where
  page_namespace = 0
  and page_id in (
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
  and page_id in (select distinct el_from from externallinks)
UNION
select
  "true" as is_proj_med,
  "false" as has_ext_links,
  count(distinct page_id) as distinct_pages
from
  page
where
  page_namespace = 0
  and page_id in (
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
  and page_id not in (select distinct el_from from externallinks)
UNION
select
  "false" as is_proj_med,
  "true" as has_ext_links,
  count(distinct page_id) as distinct_pages
from
  page
where
  page_namespace = 0
  and page_id not in (
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
  and page_id in (select distinct el_from from externallinks)
UNION
select
  "false" as is_proj_med,
  "false" as has_ext_links,
  count(distinct page_id) as distinct_pages
from
  page
where
  page_namespace = 0
  and page_id not in (
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
  and page_id not in (select distinct el_from from externallinks)
