FROM mysql:5.5

ENV MYSQL_ROOT_PASSWORD nix
ENV MYSQL_USER wisski
ENV MYSQL_PASSWORD wisski
ENV MYSQL_DATABASE wisski

# RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
