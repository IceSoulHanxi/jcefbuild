FROM i386/alpine

# Upgrade all packages
RUN apk update && apk upgrade

# Install build tools
RUN apk add bash build-base git openssl && \
    apk add openjdk8 && \
    apk add python2 && \
    apk add ninja && \
    apk add cmake

# Add java bin to the path
RUN export PATH="/usr/lib/jvm/java-1.8-openjdk/bin/:$PATH"

ENV JAVA_HOME '/usr/lib/jvm/java-1.8-openjdk'

CMD ["/bin/bash"]

# ENV BUILD_PACKAGES bash git openssh curl-dev ruby-dev build-base
# ENV RUBY_PACKAGES ruby ruby-io-console
#
# # Update and install base packages
# RUN apk update && \
#     apk upgrade && \
#     apk add $BUILD_PACKAGES && \
#     apk add $RUBY_PACKAGES && \
#     rm -rf /var/cache/apk/*
#
# RUN gem install travis bigdecimal --no-rdoc --no-ri
#
# # Travis support gems...
# WORKDIR /src/app/travis-support
#
# RUN git clone https://github.com/travis-ci/travis-support.git .
# RUN gem build ./travis-support.gemspec && \
#     gem install travis-support --no-rdoc --no-ri
#
# WORKDIR /src/app/travis-github_apps
#
# RUN git clone https://github.com/travis-ci/travis-github_apps.git .
# RUN gem build ./travis-github_apps.gemspec && \
#     gem install travis-github_apps --no-rdoc --no-ri
#
# WORKDIR /src/app/travis-rollout
#
# RUN git clone https://github.com/travis-ci/travis-rollout.git .
# RUN gem build ./travis-rollout.gemspec && \
#     gem install travis-rollout --no-rdoc --no-ri
#
# WORKDIR /src/app
#
# # Travis build
# RUN git clone https://github.com/travis-ci/travis-build
# WORKDIR travis-build
#
# RUN rm Gemfile.lock && \
#     mkdir -p ~/.travis && \
#     ln -s $PWD ~/.travis/travis-build && \
#     gem install bundler --no-rdoc --no-ri && \
#     bundle install --gemfile ~/.travis/travis-build/Gemfile && \
#     bundler add travis && \
#     bundler binstubs travis
#
# WORKDIR /tmp/jcef
# COPY . .
#
# CMD ["bash", "-c", "travis compile --org --no-interactive"]