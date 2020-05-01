# Docker Image for "Ruby on Rails"

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/rails?style=for-the-badge)](https://hub.docker.com/r/genzouw/rails/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/rails.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/rails/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/rails.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/rails/)


[![dockeri.co](https://dockeri.co/image/genzouw/rails)](https://hub.docker.com/r/genzouw/rails)

## Description

*Please contact me anytime if you have a problem or request! My information is posted at the bottom of this document.*

## Requirements

* [Docker](https://www.docker.com/)

## Installation

**You do not need to install !**

## Usage

### Create app

```bash
# Rails version 5.2.4
$ docker run --rm \
  -v $PWD:/app:cached \
  --workdir /app \
  genzouw/rails:5.2.4 \
  rails new rails-app

$ cd rails-app/
```

### Install bundle

```bash
$ sed -i "
/sqlite3/d;
/group :development, :test do/a \ \ gem 'sqlite3', '~> 1.3.6';
" Gemfile

$ docker run --rm \
  -v $PWD:/app:cached \
  --workdir /app \
  -e BUNDLE_APP_CONFIG="/app/.bundle" \
  -e BUNDLE_SET="path vendor/bundle" \
  -e BUNDLE_DISABLE_SHARED_GEMS="true" \
  -e BUNDLE_PATH="vendor/bundle" \
  -e BUNDLE_JOBS="10" \
  genzouw/rails:5.2.3 \
  bin/bundle install
```

### Launch

```bash
$ docker run -it --rm \
  -v $PWD:/app:cached \
  --workdir /app \
  -e BUNDLE_APP_CONFIG="/app/.bundle" \
  -e BUNDLE_SET="path vendor/bundle" \
  -e BUNDLE_DISABLE_SHARED_GEMS="true" \
  -e BUNDLE_PATH="vendor/bundle" \
  -p 3000:3000 \
  genzouw/rails:5.2.3 \
  bin/rails server -b 0.0.0.0
```

### Other

**I recommend that you set the following alias in `~/.*rc`.**

```bash
$ alias rails='docker run --rm -v $PWD:/app:cached --workdir /app genzouw/rails:5.2.4 rails'
```

## Configuration

```bash
# hogehoge
$ export XXX=
```

## Relase Note

|date      |version|note          |
|---       |---    |---           |
|2020-05-01|0.1    |first release.|


## License

This software is released under the MIT License, see LICENSE.


## Help

Got a question ?

File a [Github issue](https://github.com/genzouw/rails/issues), send an email to [genzouw@gmail.com](mailto:genzouw@gmail.com) or tweet to [@genzouw](https://twitter.com/genzouw) on Twitter.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
