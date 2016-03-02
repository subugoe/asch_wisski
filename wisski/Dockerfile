#FROM iiiepe/apache-drupal6
FROM asch/drupal

MAINTAINER Jürgen Dönitz


ENV release fractnolc

RUN apt-get update
RUN apt-get -y install wget

RUN cd /tmp && wget http://ftp.drupal.org/files/projects/drupal-6.9.tar.gz
RUN mkdir /var/www/wisski
RUN cd /var/www/wisski && tar -xzvf /tmp/drupal-6.9.tar.gz --strip-components 1
RUN rm /var/www/index.html

RUN cp /var/www/wisski/sites/default/default.settings.php /var/www/wisski/sites/default/settings.php

RUN cd /tmp && wget http://wiss-ki.eu/sites/default/files/wisski_fratnolc.tgz
RUN cd /var/www/wisski/sites/all && tar xvfz /tmp/wisski_fratnolc.t* --strip-components 1 			# Accept tar.gz as well as tgz

ADD ./config/default.settings.php /var/www/wisski/sites/default/default.settings.php
RUN a=a
ADD ./config/settings.php /var/www/wisski/sites/default/settings.php

RUN mkdir /var/www/wisski/sites/default/files
RUN chown www-data /var/www/wisski/sites/default/files 
RUN chown www-data /var/www/wisski/sites/default/settings.php

ADD ./config/php.ini /etc/php5/apache2/php.ini


