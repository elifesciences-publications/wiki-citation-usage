-- Daily count total # W pages
select count(distinct page_id) from page
where page_namespace = 0;
