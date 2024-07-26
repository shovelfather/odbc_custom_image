FROM decisionscore/platform:latest

RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends \
  unixodbc=2.3.11-2+deb12u1 odbcinst=2.3.11-2+deb12u1 &&\
  rm -rf /var/lib/apt/lists/* &&\
  mkdir -p "/opt/db2"

ENV IBM_DB_HOME="/opt/db2"

ENV LD_LIBRARY_PATH="/lib/x86_64-linux-gnu/libodbc.so.2"

COPY "clidriver" "${IBM_DB_HOME}/clidriver"

COPY "odbcinst.ini" "/etc/odbcinst.ini"
