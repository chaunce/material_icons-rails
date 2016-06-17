module MaterialIcons
  module Rails
    class Engine < ::Rails::Engine
      config.generators do |generators|
        generators.test_framework :rspec, :fixture => false
        # generators.assets true
        # generators.helper true
      end
    end
  end
end
