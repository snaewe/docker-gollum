FROM debian:wheezy

MAINTAINER Stefan Naewe <stefan.naewe@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y -q build-essential python2.7 bundler libicu-dev libreadline-dev libssl-dev zlib1g-dev git-core ruby1.9.3
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install gollum
RUN gem install gollum redcarpet github-markdown asciidoctor

# Initialize wiki data
RUN mkdir /root/wikidata
RUN git init /root/wikidata

# Expose default gollum port 4567
EXPOSE 4567

ENTRYPOINT ["/usr/local/bin/gollum", "/root/wikidata"]