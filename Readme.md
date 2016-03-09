The wisski image inherits from the "abstract" drupal image. The drupal image 
is required to build the wisski image, but not later on to run the images.
docker-compose is not able to handle such dependencies, therefore the drupal
image has to be build once manually with

docker build -t asch/drupal .

## Import and export mysql dump

### Preperation
On the shell source the file with the mysql account.

. mysql.env                    # source the account settings for mysql

#### Import
zcat mysql/wisski.sql.gz | docker exec -i aschwisski_db_1 mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h127.0.0.1 $MYSQL_DATABASE
#### Export
docker exec -i aschwisski_db_1 mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD -h127.0.0.1 $MYSQL_DATABASE | gzip > mysql/wisski_$(date +%Y-%m-%d).sql.gz


