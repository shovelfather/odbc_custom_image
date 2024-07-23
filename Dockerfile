FROM decisionscore/platform:latest

RUN apt-get update -y &&\
  apt-get install -y unixodbc odbcinst &&\
  mkdir -p "/opt/db2"

ENV IBM_DB_HOME="/opt/db2"

ENV LD_LIBRARY_PATH="/lib/x86_64-linux-gnu/libodbc.so.2"

COPY "clidriver" "${IBM_DB_HOME}/clidriver"

COPY "db2cli.ini" "${IBM_DB_HOME}/clidriver/cfg/db2cli.ini"

COPY "odbc.ini" "/etc/odbc.ini"

COPY "odbcinst.ini" "/etc/odbcinst.ini"
