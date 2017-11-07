FROM ruby:2.3.5-alpine

WORKDIR /var/www

RUN apk add --update \
  bash \
  build-base \
  libxml2-dev \
  libxslt-dev \
  ca-certificates \
  gcc \
  nodejs \
  imagemagick \
  sqlite \
  sqlite-dev \
  tzdata \
  && rm -rf /var/cache/apk/*

RUN echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories
RUN apk add --update yarn \
  && rm -rf /var/cache/apk/*

ADD Gemfile /var/www/Gemfile
ADD Gemfile.lock /var/www/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install


ADD . /var/www
RUN bundle exec rails assets:precompile

CMD [ "ruby", "/var/www/dockerized.rb" ]