ARG tag="latest"
FROM "decisionscore/platform:${tag}"

#note that this will fail if you don't have an internet connection
RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends \
  unixodbc=2.3.11-2+deb12u1 odbcinst=2.3.11-2+deb12u1 &&\
  rm -rf /var/lib/apt/lists/* &&\
  mkdir -p "/opt/db2"

ENV IBM_DB_HOME="/opt/db2"

#this path might be different on non-Debian systems, beware if translating for a
#different distribution.
ENV LD_LIBRARY_PATH="/lib/x86_64-linux-gnu/libodbc.so.2"

#IMPORTANT
#you NEED to bring your own copy of the clidriver. go get it from IBM if you
#don't have it, then come back
COPY "clidriver" "${IBM_DB_HOME}/clidriver"

COPY "odbcinst.ini" "/etc/odbcinst.ini"
