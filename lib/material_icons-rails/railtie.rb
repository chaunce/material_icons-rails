class Railtie < Rails::Railtie
  initializer 'material_icons-rails' do |app|
    ApplicationHelper.include MaterialIcons::Rails::IconHelper
  end
end
