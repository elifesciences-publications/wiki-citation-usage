-- count of W pages by # of external links
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
          page_id
        FROM
          page
        WHERE
          page_namespace = 0
      )
    group by
      el_from
  ) as pages_n_linkcounts
group by
  num_extlinks
order by
  count(*) desc

