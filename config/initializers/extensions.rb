# https://gist.github.com/maxivak/381f1e964923f1d469c8d39da8e2522f
# Autoload production rails 5 disabled by default

Dir[Rails.root.join('lib', '**', '*.rb')].each { |file| require file }
