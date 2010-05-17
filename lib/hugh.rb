module Hugh
  require 'hugh/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3
  autoload 'Helpers', 'hugh/helpers'
end