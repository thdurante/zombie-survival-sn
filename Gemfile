source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap',                 '>= 1.1.0', require: false
gem 'figaro',                   '~> 1.1.1'
gem 'newrelic_rpm',             '~> 5.1.0'
gem 'pg',                       '>= 0.18', '< 2.0'
gem 'puma',                     '~> 3.11'
gem 'rack-cors',                '~> 1.0.2'
gem 'rails',                    '~> 5.2.0'
gem 'rollbar',                  '~> 2.16.0'
gem 'tzinfo-data',              '~> 1.2.5', platforms: %i(mingw mswin x64_mingw jruby)

group :development, :test do
  gem 'byebug',             '~> 10.0.2', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails',  '~> 4.8.2'
  gem 'faker',              '~> 1.8.7'
  gem 'pry-rails',          '~> 0.3'
  gem 'rspec-rails',        '~> 3.7'
  gem 'rubocop',            '~> 0.55.0', require: false
  gem 'rubocop-rspec',      '~> 1.26.0'
end

group :development do
  gem 'better_errors',          '~> 2.4.0'
  gem 'binding_of_caller',      '~> 0.8.0'
  gem 'bullet',                 '~> 5.7.5'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring',                 '~> 2.0.2'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'web-console',            '>= 3.3.0'
end

group :test do
  gem 'codecov',                  '0.1.10', require: false
  gem 'database_cleaner',         '>= 1.6.2'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'shoulda-matchers',         '~> 3.1'
  gem 'simplecov',                '~> 0.16.1', require: false
  gem 'webmock',                  '~> 3.3.0'
end
