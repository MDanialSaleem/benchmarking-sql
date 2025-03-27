FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential cmake postgresql-client git sqlite3 bc unzip

WORKDIR /proj

COPY tpch.zip .
RUN unzip -q tpch.zip && rm tpch.zip

RUN git clone https://github.com/osdldbt/dbt3.git

WORKDIR /proj/dbt3

RUN make -f Makefile.cmake release && \
    cd builds/release && \
    cmake --install . --prefix /usr/local

CMD ["/bin/bash"]
