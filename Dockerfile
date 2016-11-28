FROM ruby:2.3
MAINTAINER M. Gamsjager <mgamsjager@gmail.com>
ENV REFRESHED_AT 2016-11-28

RUN apt-get update -qq && apt-get install -y build-essential

# for node
RUN apt-get install -y python python-dev python-pip python-virtualenv

# cleanup
RUN rm -rf /var/lib/apt/lists/*

# install nodejs

RUN cd /tmp && \
  wget https://nodejs.org/dist/v6.9.1/node-v6.9.1-linux-x64.tar.gz && \
  tar xvzf node-v6.9.1-linux-x64.tar.gz  &&\
  rm -f node-v6.9.1-linux-x64.tar.gz  &&\
  cd node-v6.9.1-linux-x64  && \
  pwd && \
  cp bin/node /usr/bin && \
  wget https://npmjs.org/install.sh  && \
  sh install.sh && \
  node -v && \
  npm -v  
