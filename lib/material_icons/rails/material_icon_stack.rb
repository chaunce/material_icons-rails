module MaterialIcons
  module Rails
    class MaterialIconStack < OpenStruct

      include ActionView::Helpers::TagHelper

      cattr_accessor(:style_options_attributes) { [:class, :style] }

      def initialize(icons, options = {})
        material_icons = icons.collect{ |icon, options| MaterialIcon.new(icon, options.except(:text)) }
        super(options.merge({icons: material_icons}))
        fill_defaults
        normalize
      end

      def to_html
        content_tag(self[:tag], self[:icons].collect(&:to_html).join.html_safe + self[:text], style_options_attributes.collect{ |a| [a, self[a] || self.send(a)] }.to_h)
      end

      private

      def fill_defaults
        {
          tag: 'span',
          text: '',
          size: '1em',
        }.each{ |k, v| self[k] = v unless self[k].present? }
      end

      def normalize
        self[:size] = case self[:size]
        when /^\d+x$/ then "#{size.to_i}em"
        when self[:size].to_i.to_s then "#{size}px"
        else self[:size]
        end

        self[:class] = case self[:class]
        when Array then self[:class]
        when String then self[:class].split(' ')
        else []
        end.concat(['material-icons-stack'])
      end

    end
  end
end
