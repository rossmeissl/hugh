require 'hugh/railtie' if defined?(Rails) && Rails::VERSION::MAJOR >= 3

module Hugh
  autoload 'Helpers', 'hugh/helpers'
end

ActionView::Base.send :include, Hugh::Helpers