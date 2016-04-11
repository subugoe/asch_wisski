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
docker exec -i aschwisski_db_1 mysqldump --skip-extended-insert q-u$MYSQL_USER -p$MYSQL_PASSWORD -h127.0.0.1 $MYSQL_DATABASE | gzip > mysql/wisski_$(date +%Y-%m-%d).sql.gz

## Installing WissKI

* Made SQL dump mysql/wisski_after_initial_setup.sql.gz


* Following the instructions from http://wiss-ki.eu/from_drupal_to_wisski
* Activated modules
  * Menu per Role
  * WissKI
  * WissKI TripleStore Backend
  * Path
  * WissKI Find Module
  * WissKI Pathbuilder API
  * WissKI Simple Resoner API
  * WissKI Jit Visualization
  * WissKI Navigator Module
  * WissKI Special Pages
* Changed the theme to BlendedMalts

* Made SQL Dump mysql/wisski_after_wisski_init.sql.gz
* Loaded the ontology from http://erlangen-crm.org/150929/
* Made SQL Dump  mysql/wisski_after_loading_ontology.sql.gz

docker-compose up -d            # to start the WissKi

## Import path definition
* Administer -> "WissKI module settings" -> Pathbuilder -> "Import Paths" -> load e.g. https://raw.githubusercontent.com/subugoe/asch_wisski/master/wisski/path_definition.xml