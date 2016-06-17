require 'spec_helper'

RSpec.describe MaterialIcons::Rails::IconHelper, type: :helper do
  describe 'material_icon' do
    it 'builds icon tag' do
      expect(material_icon(:face)).to eq('<i class="material-icons">face</i>')
    end
  end
end
