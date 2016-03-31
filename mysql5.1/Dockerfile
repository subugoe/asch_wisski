FROM	ubuntu:12.04


RUN	apt-get update
RUN	apt-get install -y wget gcc libncurses5-dev libedit-dev libreadline-dev  libssl-dev make g++

RUN	cd /tmp && wget http://downloads.mysql.com/archives/mysql-5.1/mysql-5.1.65.tar.gz
RUN 	cd /tmp && tar -zxf mysql-5.1.65.tar.gz
RUN	cd /tmp/mysql-5.1.65 && ./configure  '--prefix=/usr' '--exec-prefix=/usr' '--libexecdir=/usr/sbin' '--datadir=/usr/share' '--localstatedir=/var/lib/mysql' '--includedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--with-system-type=debian-linux-gnu' '--enable-shared' '--enable-static' '--enable-thread-safe-client'  '--enable-local-infile' '--with-fast-mutexes' '--with-big-tables' '--with-unix-socket-path=/var/run/mysqld/mysqld.sock' '--with-mysqld-user=mysql' '--with-libwrap' '--with-ssl' '--without-docs' '--with-extra-charsets=all' '--with-plugins=max' '--with-embedded-server' '--with-embedded-privilege-control' '--with-readline'
RUN	apt-get -y install g++
RUN	 cd /tmp/mysql-5.1.65 && make
RUN	 cd /tmp/mysql-5.1.65 && make install

ENV 	MYSQL_ROOT_PASSWORD nix
ENV 	MYSQL_USER wisski
ENV 	MYSQL_PASSWORD wisski
ENV 	MYSQL_DATABASE wisski

RUN groupadd -r mysql && useradd -r -g mysql mysql
RUN	mkdir /var/lib/mysql/
RUN	chown mysql /var/lib/mysql/
RUN	mkdir /var/run/mysqld/
RUN	chown mysql /var/run/mysqld/
USER	mysql

COPY	entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]