# this is dockerfile covers neo4j and some random stuff for testing
#
FROM java:openjdk-8-jre

ENV NEO4J_HOME /neo4j

RUN apt-get update -y
RUN apt-get install lsof -y

WORKDIR /
RUN wget -q -O neo4j-2.3.1.tar.gz http://neo4j.com/artifact.php?name=neo4j-community-2.3.1-unix.tar.gz
RUN tar xf neo4j-2.3.1.tar.gz

EXPOSE 7474 7473
#end neo4j

RUN apt-get install gcc -y
RUN apt-get install build-essential -y
RUN apt-get install libncursesw5-dev -y
RUN wget -q -O gtypist-2.9.5.tar.gz http://ftp.gnu.org/gnu/gtypist/gtypist-2.9.5.tar.gz
RUN tar xf gtypist-2.9.5.tar.gz 
WORKDIR /gtypist-2.9.5
RUN ./configure
RUN make
RUN make install
ENV TERM xterm

# myman
RUN apt-get install libncurses5-dev groff -y
RUN wget http://downloads.sourceforge.net/project/myman/myman-cvs/myman-cvs-2009-10-30/myman-wip-2009-10-30.tar.gz
RUN tar xvfvz myman-wip-2009-10-30.tar.gz
RUN ./configure
RUN make
RUN make install

CMD sleep 999999
