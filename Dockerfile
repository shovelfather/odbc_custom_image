ARG tag="latest"

FROM "decisionscore/platform:${tag}"

ENV IBM_DB_HOME="/opt/db2"

ENV SNOWFLAKE_DB_HOME="/opt/snowflake"

#IMPORTANT
#you NEED to bring your own copy of the clidriver. go get it from IBM if you
#don't have it, then come back
COPY "clidriver" "${IBM_DB_HOME}/clidriver"

COPY "odbcinst.ini" "/etc/odbcinst.ini"

#note that this will fail if you don't have an internet connection
RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends \
  unixodbc=2.3.11-2+deb12u1 odbcinst=2.3.11-2+deb12u1 &&\
  rm -rf /var/lib/apt/lists/* &&\
  mkdir -p "/opt/db2" &&\
  mkdir -p "/opt/snowflake"

ADD "snowflake_linux_x8664_odbc*.3.2.tgz" "${SNOWFLAKE_DB_HOME}"

RUN chmod 700 ${SNOWFLAKE_DB_HOME}/snowflake_odbc/unixodbc_setup.sh &&\
  ${SNOWFLAKE_DB_HOME}/snowflake_odbc/unixodbc_setup.sh

#this path might be different on non-Debian systems, beware if translating for a
#different distribution.
ENV LD_LIBRARY_PATH="/lib/x86_64-linux-gnu/libodbc.so.2"
