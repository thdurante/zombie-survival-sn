source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap',     '>= 1.1.0', require: false
gem 'pg',           '>= 0.18', '< 2.0'
gem 'puma',         '~> 3.11'
gem 'rack-cors',    '~> 1.0.2'
gem 'rails',        '~> 5.2.0'
gem 'tzinfo-data',  '~> 1.2.5', platforms: %i(mingw mswin x64_mingw jruby)

group :development, :test do
  gem 'byebug', '~> 10.0.2', platforms: %i(mri mingw x64_mingw)
end

group :development do
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring',                 '~> 2.0.2'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end
