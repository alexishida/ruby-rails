#!/bin/bash

export RAILS_ENV=production
cd /app
gem install bundler
bundle update
rails db:create
rails db:migrate
rails db:seed
rails assets:precompile
rails s -b 0.0.0.0