-- Daily listing of WPM pages
-- defines WP:M pages as pages both with and without Ext links; query produces a list of pages so count can come from `wc out/wiki_proj_med_pages-YYYYMMDD.txt` 
SELECT  page2.page_id, page2.page_latest as revision_id, page2.page_title, now() as dt
FROM page
INNER JOIN page page2
ON page.page_title=page2.page_title
INNER JOIN categorylinks  ON   cl_from = page.page_id
AND   categorylinks.cl_to = "All_WikiProject_Medicine_articles"
WHERE page.page_namespace = 1 
AND page2.page_namespace = 0
