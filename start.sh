cd cert-tools
aws s3 cp s3://issuer-data/$issuer/conf.ini conf.ini
aws s3 cp s3://issuer-data/$issuer/logo.png data/images/logo.png

aws s3 cp s3://issuer-data/$issuer/$batchId/raw-data/ data/images/ --recursive
aws s3 cp s3://issuer-data/$issuer/$batchId/raw-data/roster.csv data/rosters/roster.csv

create-certificate-template -c conf.ini
instantiate-certificate-batch -c conf.ini

rm data/unsigned_certificates/.placeholder
aws s3 cp data/unsigned_certificates s3://issuer-data/$issuer/$batchId/unissued-certs/ --recursive
aws s3 cp data/mapping.csv s3://issuer-data/$issuer/$batchId/unissued-certs/mapping.csv
