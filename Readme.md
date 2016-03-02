The wisski image inherits from the "abstract" drupal image. The drupal image 
is required to build the wisski image, but not later on to run the images.
docker-compose is not able to handle such dependencies, therefore the drupal
image has to be build once manually with

docker build -t asch/drupal .

## Import mysql dump

zcat mysql/wisski.sql.gz | docker exec -i dockerwisski_db_1 mysql -uwisski -pwisski -h127.0.0.1 wisski

