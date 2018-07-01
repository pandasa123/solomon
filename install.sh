#!/bin/bash

sudo ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install rbenv ruby-build

echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

rbenv install 2.3.0
rbenv global 2.3.0
ruby -v

gem install rails -v 4.2.4
rbenv rehash
rails -v

brew install postgresql

initdb /usr/local/var/postgres -E utf8

gem install lunchy

mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/postgresql/10.4/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/

lunchy start postgres

brew install elasticsearch

elasticsearch

brew install redis

redis-server

git clone https://github.com/pandasa123/solomon.git

cd solomon

bundle install

bundle exec sidekiq -q elastic search -q mailer -c 3

rake db:setup
rake db:migrate

rake elasticsearch:reindex

rails server