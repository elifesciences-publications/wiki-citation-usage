-- count of WP:M pages by # of external links
select
  num_extlinks,
  count(*) as num_pages
from
  (
    select
      el_from,
      count(distinct el_to) as num_extlinks
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
      el_from
  ) as pages_n_linkcounts
group by
  num_extlinks
order by
  count(*) desc

