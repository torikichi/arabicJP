#!/bin/sh
rm -f tmp/pids/server.pid
yarn install
bundle install -j4 --retry 5
bundle exec rails db:create db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0'
