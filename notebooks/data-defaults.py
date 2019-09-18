## basic setup
# use PySpark YARN kernel
import pyspark
import re
import pyspark.sql
from pyspark.sql import *
import pandas as pd
import matplotlib.pyplot as plt
import hashlib
import os.path
from pyspark.sql.functions import desc
from datetime import timedelta, date
from IPython.display import display, Markdown

spark_hive = pyspark.sql.HiveContext(sc)


## basic data defaults
# set date ranges for all queries
start_date = date(2019, 3, 22)
end_date = date(2019, 4, 22)
date_format = '%Y-%m-%d'
start_date_string = start_date.strftime(date_format)
end_date_string = end_date.strftime(date_format)
days_in_study = (end_date-start_date).days + 1

# for iterating over the range of study dates (used in daily count of events queries)
def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days + 1)):
        yield start_date + timedelta(n)

# convenience method for converting dates to 'YYYY-MM-DD%' for SQL queries
def date_to_dt(date):
    return str(date.year) + '-' + '{0:02d}'.format(date.month) + '-' + '{0:02d}'.format(date.day) + '%'

## common exclusion SQL
#
# exclude event data that is either: 
# - has page or revision ID of zero (pages not yet created as per bmansurov https://phabricator.wikimedia.org/T213969#4998281)
# - is 'extClick' but is an internal link improperly coded as external as per bmansurov https://phabricator.wikimedia.org/T213969#5003710
event_exclusion_sql = """
AND (citationusage.page_id = 0 OR citationusage.revision_id = 0) = FALSE
AND (citationusage.action = 'extClick' AND 
    (citationusage.link_url LIKE 'https://en.wikipedia.org%' 
    OR citationusage.link_url LIKE 'https://en.m.wikipedia.org%')) = FALSE
"""
# exclude pageload data that:
# - has page or revision ID of zero (pages not yet created as per bmansurov https://phabricator.wikimedia.org/T213969#4998281)
pageload_exclusion_sql = """
AND (citationusagepageload.page_id = 0 OR citationusagepageload.revision_id = 0) = FALSE
"""

## load anonymized data from parquet files extracted with [DatasetAnonymization.ipynb](DatasetAnonymization.ipynb)
parquetFilePageloads = spark.read.parquet("/user/ryanmax/anonymous_pageloads_april.parquet")
parquetFileCitationusage = spark.read.parquet("/user/ryanmax/anonymous_citationusage_april.parquet")
parquetFilePageloads.createOrReplaceTempView("citationusagepageload")
parquetFileCitationusage.createOrReplaceTempView("citationusage")

#Extra libs and plotting
sc.addPyFile("/home/piccardi/libs/seaborn-0.9.0-py3.5.egg")
from matplotlib.pyplot import figure
from matplotlib import pyplot
import numpy as np
import seaborn as sns
