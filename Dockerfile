# Docker image to host static files generated from Markdown and Jerkyll (via ruby)

# Server host: Ruby and Jekyll

# Default Environment variables, used to get specific versions of images and libraries.
# Being explicit about image/package versions is to make image more Immutable, and easier to test with.

# application version number
ARG APP_VERSION="0.1.0"
# node.js version 
ARG NODEJS_VERSION="16.5.0-alpine"
# ruby version
ARG RUBY_VERSION="3.0.2-alpine"


# Use ruby to create a static website from the markdown and CSS
FROM "ruby:${RUBY_VERSION}" as builder

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY ./Gemfile /usr/src/app
RUN bundle install

# copy over binary (should have permissions set from build stage)
COPY ./ /usr/src/app

RUN bundle exec jekyll build

# metadata
LABEL maintainer="jamesaaddis@gmail.com"
LABEL version="${APP_VERSION}"
LABEL description="Jekyll app to host files for James Addis' CV"