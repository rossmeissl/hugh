if defined?(Rails) && Rails::VERSION::MAJOR >= 3

  class HughAssetsGenerator < Rails::Generators::Base

    include Rails::Generators::Actions

    def create_hugh_file
      empty_directory('public/javascripts')
      copy_file(
        File.join(File.dirname(__FILE__), 'templates', 'hugh.js'),
        'public/javascripts/hugh.js'
      )
      empty_directory('public/stylesheets/images/hugh')
      copy_file(
        File.join(File.dirname(__FILE__), 'templates', 'hugh.css'),
        'public/stylesheets/hugh.css'
      )
      copy_file(
        File.join(File.dirname(__FILE__), 'templates', 'spectrum.png'),
        'public/stylesheets/images/hugh/spectrum.png'
      )
      readme(File.join(File.dirname(__FILE__), 'templates', 'NOTES'))
    end

  end

else

  class HughAssetsGenerator < Rails::Generator::Base

    def manifest
      record do |m|
        m.directory('public/javascripts')
        m.file('hugh.js', 'public/javascripts/hugh.js')
        m.directory('public/stylesheets/images/hugh')
        m.file('hugh.css', 'public/stylesheets/hugh.css')
        m.file('spectrum.png', 'public/stylesheets/images/hugh/spectrum.png')
        m.readme('NOTES')
      end
    end

  end

end


