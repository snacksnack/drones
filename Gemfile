source 'https://rubygems.org'
ruby "2.0.0"

#require 'rubygems'
#require 'mongo'

gem 'rails', '3.2.14'
#gem "rake", "!= 0.9.0"
gem 'heroku'
gem 'rails_12factor'
gem 'thin'
gem 'mongoid', '~> 3.1.6'
gem 'mongoid3_metastamp', :git => "git://github.com/nvdk/mongoid3-metastamp.git"
gem 'html2haml'
gem 'chartkick'
gem 'rickshaw_rails'
gem 'haml'
gem 'haml-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'figaro'
gem 'httparty'

group :development, :test do
  gem 'mongoid-rspec'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', :github => 'guard/guard-spork' 
  gem 'spork', '0.9.2'
  gem 'factory_girl_rails'
  gem 'capybara', '2.1.0'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rb-fsevent', :require => false
  gem 'growl', '1.0.3'
  gem 'database_cleaner'
  
  #gem 'guard-spork', '0.3.2'
  #gem 'spork', '0.9.0'
  
  #gem 'launchy', '2.1.0'
  #gem 'rb-fsevent'
  #gem 'growl'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end