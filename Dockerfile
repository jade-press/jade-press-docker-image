FROM ubuntu:xenial
RUN apt-get update -y
RUN apt-get install -y apt-utils git libkrb5-dev libcairo2-dev
RUN apt-get install -y libjpeg8-dev libpango1.0-dev
RUN apt-get install -y libgif-dev build-essential
RUN apt-get install -y openjdk-8-jre
RUN apt-get install -y g++ wget
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update -y
RUN apt-get install -y mongodb-org wget


# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# Install NODE
RUN source ~/.nvm/nvm.sh; \
    nvm install 6.3.1 \
    nvm use 6.3.1;
RUN /root/.nvm/versions/node/v6.3.1/lib/node_modules/npm/bin/npm install -g bower gulp
