-- Daily listing of Page ID, Revision ID, Classes (for WPM Only) 
SELECT
  page_id,
  revision_id,
  page_title,
  cl_to,
  now()
FROM
  (
    SELECT
      page2.page_id,
      page2.page_title,
      page2.page_latest as revision_id,
      page.page_id as page_id_talk
    FROM
      page
      INNER JOIN page page2 ON page.page_title = page2.page_title
      INNER JOIN categorylinks ON cl_from = page.page_id
      AND categorylinks.cl_to = "All_WikiProject_Medicine_articles"
    WHERE
      page.page_namespace = 1
      AND page2.page_namespace = 0
  ) as wiki_pm_pages
  INNER JOIN categorylinks ON cl_from = wiki_pm_pages.page_id_talk
 -- WHERE cl_to like '%Class%';
