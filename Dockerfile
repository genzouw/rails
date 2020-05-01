FROM ruby:2.7.1

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get -y install \
    --no-install-recommends \
    nodejs \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
  && gem update \
  && gem install bundler \
  ;

RUN gem install rails -v 5.1.7
