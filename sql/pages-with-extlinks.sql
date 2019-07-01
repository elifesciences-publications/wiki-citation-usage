-- Daily listing of W pages w/ external links
SELECT distinct page_id, page_latest as revision_id, now() as dt
FROM page
WHERE page_namespace = 0 
AND page_id in (select distinct el_from from externallinks)
