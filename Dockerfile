
FROM ubuntu:16.04

RUN apt-get update && apt-get -y install curl git bzip2 build-essential libssl-dev libreadline-dev zlib1g-dev

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs

RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
ENV PATH "/root/.rbenv/bin:/root/.rbenv/shims:$PATH"
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

RUN mkdir -p "$(rbenv root)"/plugins
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

RUN rbenv install 2.6.0
RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

RUN rbenv local 2.6.0
RUN gem install bundler

WORKDIR /app
COPY . .

RUN apt-get -y install libsqlite3-dev

RUN bundle install
RUN rbenv rehash

RUN rake assets:precompile
RUN rails db:migrate

CMD rails s
