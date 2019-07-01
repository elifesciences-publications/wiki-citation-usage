-- Daily count of total Ext Links in W
select count(distinct page_id, el_to) as extlinks_in_ns0 from externallinks, page
where page.page_id = externallinks.el_from
and page_namespace = 0;
