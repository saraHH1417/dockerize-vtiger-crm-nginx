FROM mysql:8.0.31

ARG DBUSER;
ARG DBPassword;
ARG DBHOST;
ARG DBNAME;

RUN rm -rf /etc/my.cnf
COPY my.cnf /etc


COPY ./queries/database.sql /docker-entrypoint-initdb.d

# ADD ./queries/database.sql /etc/mysql/data.sql

# RUN sed -i 's/MYSQL_DATABASE/'$MYSQL_DATABASE'/g' /etc/mysql/data.sql
# RUN cp /etc/mysql/data.sql /docker-entrypoint-initdb.d


# RUN mysql -u ${DBUSER} -p${DBPassword} -e "CREATE DATABASE  IF NOT EXISTS  ${DBNAME} CHARACTER SET = 'utf8' COLLATE = 'utf8_general_ci';"
# RUN mysql -h ${DBHOST} -u ${DBUSER} -p${DBPassword}  ${DBNAME}  --default-character-set=utf8 --silent -e "SET names 'utf8';"

# RUN "${mysql[@]}" < /home/database.sql
# RUN "${mysql[@]}" < /home/after-database.sql

# adpNW3W4CTRXw%  hardwork33
