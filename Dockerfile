FROM ubuntu:xenial
RUN apt-get update -y
RUN apt-get install -y git libkrb5-dev libcairo2-dev
RUN apt-get install -y libjpeg8-dev libpango1.0-dev
RUN apt-get install -y libgif-dev build-essential
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y g++ wget
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update -y
RUN apt-get install -y mongodb-org
RUN apt-get install -y wget
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
CMD nvm install 6
CMD npm install -g bower
CMD npm install -g gulp
CMD git clone https://github.com/jade-press/jade-press.git
CMD cd jade-press
CMD cp config-sample.js config.js
CMD gulp install
CMD bower install
CMD npm install
node app
