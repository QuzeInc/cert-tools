cd cert-tools
aws s3 cp s3://issuer-data/$issuer/conf.ini conf.ini
aws s3 cp s3://issuer-data/$issuer/logo.png data/images/logo.png
aws s3 cp s3://issuer-data/$issuer/issuer-signature.png data/images/issuer-signature.png

aws s3 cp s3://issuer-data/$issuer/$batchId/images/ data/images/ --recursive
aws s3 cp s3://issuer-data/$issuer/$batchId/roster.csv data/rosters/roster.csv

create-certificate-template -c conf.ini
instantiate-certificate-batch -c conf.ini

aws s3 cp data/unsigned_certificates s3://unissued-certificates/$issuer/$batchId --recursive
