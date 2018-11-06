FROM postgres:11

MAINTAINER xzlzx (307871680@qq.com)

RUN apt-get -y update 
RUN apt-get -y install vim wget libkrb5-dev libssl-dev gcc make
RUN apt-get -y install postgresql-server-dev-11
RUN apt-get install build-essential -y
RUN apt-get install libncurses5-dev libncursesw5-dev libreadline6-dev -y
RUN apt-get install libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev -y
RUN apt-get install libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev -y
RUN apt-get install ca-certificates -y
RUN ln /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/local/libssl.so
RUN ln /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/local/libcrypto.so
RUN wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
RUN tar -Jxvf Python-3.7.1.tar.xz
RUN cd Python-3.7.1 && \
    ./configure && \
     make & make install
RUN apt-get -y install postgresql-11-mysql-fdw postgresql-plpython3-11
RUN wget https://github.com/postgrespro/pg_pathman/archive/1.5.2.tar.gz && \
  tar -xvzf 1.5.2.tar.gz && \
  cd pg_pathman-1.5.2 && make USE_PGXS=1 && make USE_PGXS=1 install && \
  cd .. && rm -R pg_pathman-1.5.2 && \
  rm -rf /var/lib/apt/lists/*
