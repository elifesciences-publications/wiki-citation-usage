# Data Analysis for [Wikipedia Citation Usage Project](https://meta.wikimedia.org/wiki/Research:Investigating_Wikipedia%27s_role_as_a_gateway_to_medical_content)

## [Notebooks](notebooks)

#### Data Population
- [Dataset Anonymization](notebooks/DatasetAnonymization.ipynb)
- [External Links](notebooks/populate-externallinks-table-from-sql-dumps.ipynb)
- [Freely Accessible Links](notebooks/populate-freely_accessible-from-dumps.ipynb)
- [Infoboxes](notebooks/populate-infobox-table-from-dumps.ipynb)
- [Page Sizes](notebooks/populate-page_lengths-table-from-dumps.ipynb)
- [Section Headings](notebooks/populate-section-table.ipynb)
- [W and WPM:M Page Subsets](notebooks/populate-pages-tables.ipynb)

#### Static Counts
 - [Freely Accessible Links](notebooks/populate-freely_accessible-from-dumps.ipynb#Counts-of-freely_accessible-links)
 - [Infoboxes](notebooks/populate-infobox-table-from-dumps.ipynb#Infobox-Counts)
 - [Section Headings](notebooks/events-and-counts--section_ids.ipynb)
 - [Top Hostnames](notebooks/events-and-counts--hostnames.ipynb)
 - [Top Level Domains](notebooks/events-and-counts--top-level-domains.ipynb)
 - [WPM Page Classes or Categories](notebooks/events-and-counts-and-pageviews--WPM-page-classes.ipynb)

#### Pageviews
 - [Overview of Pageview Data](notebooks/pageviews--overview.ipynb)
 - [Most Visited WPM Pages](notebooks/events-and-pageviews--most-visited-WPM-pages.ipynb)

#### Click Events
 - [Overview of Event Data](notebooks/events--overview.ipynb)
 - [Freely Accessible Links](notebooks/populate-freely_accessible-from-dumps.ipynb#Event-Counts)
 - [Infobox and Sections](notebooks/events--infobox-and-section.ipynb)
 - [Most Visited WPM Pages](notebooks/events-and-pageviews--most-visited-WPM-pages.ipynb)
 - [Time to Event](notebooks/events--time-to-event.ipynb)
 - [Top Hostnames](notebooks/events-and-counts--hostnames.ipynb)
 - [Top Level Domains](notebooks/events-and-counts--top-level-domains.ipynb)
 - [Section Headings](notebooks/events-and-counts--section_ids.ipynb)
 - [WPM Page Classes or Categories](notebooks/events-and-counts-and-pageviews--WPM-page-classes.ipynb)

#### Exploratory
 - [tools.wmflabs.org Links](notebooks/exploratory--tools_dot_wmflabs_dot_org-links.ipynb)
 - [NCBI and Freely Accessible Links](notebooks/exploratory--ncbi-and-free.ipynb)
 
 ## [SQL](sql)
Queries that ran against the [production MediaWiki database](https://wikitech.wikimedia.org/wiki/Analytics/Data_access#MariaDB_replicas) during the study period. The [data](data) directory contains query output for 2019-04-01 and 2019-04-20.
- [Wikipedia pages with external links](sql/pages-with-extlinks.sql)
- [Categories associated with WikiProject Medicine pages](sql/wiki_proj_med_categorylinks.sql)
- [WikiProject Medicine pages with external links](sql/wiki_proj_med_pages-with-extlinks.sql)

