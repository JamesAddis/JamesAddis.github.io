# Docker image to host static files generated from Markdown and Jerkyll (via ruby)

# Server host: Ruby and Jekyll

# Default Environment variables, used to get specific versions of images and libraries.
# Being explicit about image/package versions is to make image more Immutable, and easier to test with.

# application version number
ARG APP_VERSION="0.1.0"
# node.js version 
ARG NODEJS_VERSION="16.5.0-alpine"
# jeykll version
ARG JEKYLL_VERSION="4.2.0"


# Use Jekyll and ruby to create a static website from the markdown and CSS
FROM "jekyll/jekyll:${JEKYLL_VERSION}" as builder

WORKDIR /srv/jekyll

COPY ./Gemfile /srv/jekyll/

RUN bundle install

# copy over binary (should have permissions set from build stage)
COPY ./ /srv/jekyll/

RUN chown -R jekyll:jekyll /srv/jekyll/**/*

RUN jekyll build

USER jekyll

# metadata
LABEL maintainer="jamesaaddis@gmail.com"
LABEL version="${APP_VERSION}"
LABEL description="Jekyll app to host files for James Addis' CV"