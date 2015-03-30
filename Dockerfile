FROM ubuntu:14.04
MAINTAINER Roope Hakulinen <roope.hakulinen@gmail.com>

RUN apt-get update

# Install ruby dependencies
RUN apt-get install -y wget curl \
build-essential git git-core \
zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
RUN apt-get update

# Install ruby-install
RUN cd /tmp &&\
wget -O ruby-install-0.4.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.3.tar.gz &&\
tar -xzvf ruby-install-0.4.3.tar.gz &&\
cd ruby-install-0.4.3/ &&\
make install

# Install MRI Ruby 2.2.0
RUN ruby-install ruby 2.2.0

# Add Ruby binaries to $PATH
ENV PATH /opt/rubies/ruby-2.2.0/bin:$PATH

# Add options to gemrc
RUN echo "gem: --no-document" > ~/.gemrc

# Install bundler
RUN gem install bundler


# Install software-properties-common for add-apt-repository
RUN apt-get install -qq -y software-properties-common

# Install Nginx
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -qq -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# Add default nginx config
ADD nginx-sites.conf /etc/nginx/sites-enabled/default

# Install foreman
RUN gem install foreman
RUN gem install debase

# Install the latest postgresql lib for pg gem
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive \
apt-get install -y --force-yes libpq-dev

# Install Rails App
WORKDIR /app
ADD Gemfile /app/Gemfile
#ADD Gemfile.lock /app/Gemfile.lock
ENV RAILS_ENV development
RUN bundle install
#--without development test
ADD . /app

# Add development certificates
ADD localhost.cert /etc/ssl/certs/
ADD localhost.key /etc/ssl/private/

RUN mkdir /app/tmp/

# Add default foreman config
#CMD bundle exec rake assets:precompile
RUN rake db:create
RUN rake db:migrate
RUN rake db:seed
RUN rake swagger:docs
CMD foreman start -f Procfile

EXPOSE 443
EXPOSE 1234
EXPOSE 26126