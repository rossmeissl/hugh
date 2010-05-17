require 'hugh'
require 'rails'

module Hugh
  class Railtie < Rails::Railtie

    GEM_ROOT = File.join(File.dirname(__FILE__), '..', '..')

    initializer 'hugh.initialization' do
      require File.join(GEM_ROOT, 'rails', 'init')
    end

    generators do
      require File.join(GEM_ROOT, 'generators', 'hugh_assets_generator')
    end

  end
end
