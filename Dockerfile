FROM ruby:2.3.5-alpine

WORKDIR /var/www
ADD . /var/www

RUN apk add --update \
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

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

CMD [ "bundle", "exec", "rails", "s", "-b", "0.0.0.0" ]