import psycopg2
import csv
import boto3

con = psycopg2.connect('removed for anonymity')

# First get a cursor from your DB connection:
cur = con.cursor()

cur.execute("\
SELECT \
  e.TIMESTAMP, \
  e.account_id, \
  e.session_id, \
  m.name \
FROM \
  log_entries_v2 e INNER JOIN log_metrics_v2 m ON e.uuid = m.log_entry_uuid \
WHERE \
  e.event_date BETWEEN '2017-03-15' AND '2019-05-21' \
  AND m.event_date BETWEEN '2017-03-15' AND '2019-05-21' \
  AND e.component = 'clog' \
  AND m.component = 'clog' \
  AND (m.name LIKE 'click%') \
  AND e.service = 'rds' \
  AND e.account_id IN ('account_id_1', 'account_id_2', ...); \
");

# Store the results of the query
records = cur.fetchall()

bucketName = "click-metric-analytics"
key = "click-metrics.csv"
outputFile = "click-metrics.csv"

with open(outputFile, "w") as f:
    print "Writing to S3"
    writer = csv.writer(f, delimiter=',')
    writer.writerow(["timestamp", "account_id", "session_id", "metric"])
    for row in records:
        writer.writerow(row)

s3 = boto3.resource('s3')
s3.Bucket(bucketName).upload_file(outputFile, key)

print "Done writing "
