FROM ubuntu:xenial
RUN apt-get update -y && \
apt-get install -y apt-utils git libkrb5-dev libcairo2-dev && \
apt-get install -y libjpeg8-dev libpango1.0-dev && \
apt-get install -y libgif-dev build-essential && \
apt-get install -y openjdk-8-jre && \
apt-get install -y g++ wget && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
apt-get update -y && \
apt-get install -y mongodb-org && \
apt-get install -y wget && \
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash && \
.nvm/nvm.sh && \
nvm install 6 && \
npm install -g bower && \
npm install -g gulp

