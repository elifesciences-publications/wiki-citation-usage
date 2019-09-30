# Data Analysis for [Wikipedia Citation Usage Project](https://meta.wikimedia.org/wiki/Research:Investigating_Wikipedia%27s_role_as_a_gateway_to_medical_content)

## [Notebooks](notebooks)

#### Data Population
- [Dataset Anonymization](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/DatasetAnonymization.ipynb)
- [External Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-externallinks-table-from-sql-dumps.ipynb)
- [Page Sizes](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-page_lengths-table-from-dumps.ipynb)
- [W and WPM Page Subsets](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-pages-tables.ipynb)

#### Pageviews
 - [Overview of Pageview Data](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/pageviews--overview.ipynb)

#### Click Events
 - [Overview of Event Data](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events--overview.ipynb)

 ## [SQL](sql)
Queries that ran against the [production MediaWiki database](https://wikitech.wikimedia.org/wiki/Analytics/Data_access#MariaDB_replicas) during the study period. The [data](data) directory contains query output for 2019-04-01 and 2019-04-20.
- [Wikipedia pages with external links](sql/pages-with-extlinks.sql)
- [Categories associated with WikiProject Medicine pages](sql/wiki_proj_med_categorylinks.sql)
- [WikiProject Medicine pages with external links](sql/wiki_proj_med_pages-with-extlinks.sql)

## Other Notebooks
#### Data Population
- [Freely Accessible Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-freely_accessible-from-dumps.ipynb)
- [Infoboxes](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-infobox-table-from-dumps.ipynb)
- [Section Headings](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-section-table.ipynb)

#### Static Counts
 - [Freely Accessible Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-freely_accessible-from-dumps.ipynb#Counts-of-freely_accessible-links)
 - [Infoboxes](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-infobox-table-from-dumps.ipynb#Infobox-Counts)
 - [Section Headings](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--section_ids.ipynb)
- [Top Hostnames](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--hostnames.ipynb)
- [Top Level Domains](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--top-level-domains.ipynb)
 - [WPM Page Classes or Categories](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts-and-pageviews--WPM-page-classes.ipynb)

#### Pageviews
 - [Most Visited WPM Pages](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-pageviews--most-visited-WPM-pages.ipynb)

#### Click Events
 - [Freely Accessible Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/populate-freely_accessible-from-dumps.ipynb#Event-Counts)
 - [Infobox and Sections](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events--infobox-and-section.ipynb)
 - [Most Visited WPM Pages](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-pageviews--most-visited-WPM-pages.ipynb)
 - [Time to Event](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events--time-to-event.ipynb)
 - [Top Hostnames](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--hostnames.ipynb)
 - [Top Level Domains](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--top-level-domains.ipynb)
 - [Section Headings](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts--section_ids.ipynb)
 - [WPM Page Classes or Categories](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/events-and-counts-and-pageviews--WPM-page-classes.ipynb)

### Exploratory
 - [tools.wmflabs.org Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/exploratory--tools_dot_wmflabs_dot_org-links.ipynb)
 - [NCBI and Freely Accessible Links](https://nbviewer.jupyter.org/github/ryanmax/wiki-citation-usage/blob/master/notebooks/exploratory--ncbi-and-free.ipynb)
