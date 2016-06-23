module MaterialIcons
  module Rails
    class MaterialIcon < OpenStruct

      include ActionView::Helpers::TagHelper

      cattr_accessor(:style_options_attributes) { [:class, :style] }

      def initialize(icon, options = {})
        super(options.merge({icon: icon.to_sym}))
        fill_defaults
        normalize
      end

      def to_html
        content_tag(self[:tag], self[:icon], style_options_attributes.collect{ |a| [a, self[a] || self.send(a)] }.to_h) + self[:text]
      end

      def style
        {
          'font-size': size,
        }.collect{ |k, v| "#{k}: #{v}"}.join('; ')
      end

      private

      def fill_defaults
        {
          tag: 'i',
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
        end.concat(['material-icons'])
      end

    end
  end
end
