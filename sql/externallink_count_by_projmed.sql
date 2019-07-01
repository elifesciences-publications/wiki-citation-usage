-- Daily count of Ext links in/not in WP:M
select
  "true" as is_proj_med,
  count(distinct page_id, el_to) as cnt
from
  page
  inner join externallinks on page.page_id = externallinks.el_from
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
UNION
select
  "false" as is_proj_med,
  count(distinct page_id, el_to) as cnt
from
  page
  inner join externallinks on page.page_id = externallinks.el_from
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
