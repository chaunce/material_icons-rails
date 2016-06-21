module MaterialIcons
  module Rails
    module IconHelper
      def material_icon(icon, options = {})
        build_icon_content_tag(icon, options)
      end

      # TO-DO:
      # + stacking
      # - badge
      # - dark, light, color, inactive
      # - rotate: static/animated
      # - default icon options (used in merge_default_icon_options, merge_default_icon_container_options)

      # http://codepen.io/johnstuif/pen/pvLgYp
      # http://codepen.io/joereza/pen/ufswb

      def material_icon_stack(icons, stack_options = {})
        build_icon_container_content_tag(normalize_stack_icons(icons), stack_options)
      end

      # def material_icon_with_badge(icon, options = {})
        # options = options.with_indifferent_access
        # count = options.delete(:count)
        # content_tag(:span, fa_icon(icon, options), :'data-count' => count)
      # end

      # def material_icon_stack_with_badge(icon, options = {})
        # options = options.with_indifferent_access
        # count = options.delete(:count)
        # content_tag(:span, fa_stacked_icon(icon, options), :'data-count' => count)
      # end

      private

      def normalize_stack_icons(icons)
        case icons
        when String, Symbol
          [icons]
        when Array
          icons.zip(icons.length.times.collect{ {} })
        when Hash
          icons
        else
          # add error message here
          raise ArgumentError
        end
      end

      def merge_default_icon_options(options)
        {
          tag: 'i',
          size: '18px',
          text: '',
        }.merge(options.symbolize_keys)
      end

      def normalize_icon_options(options)
        options[:size] = {'1x' => '18px', '2x' => '24px', '3x' => '36px', '4x' => '48px'}[options[:size]] if options[:size].match(/^[1-4]x$/)
        options[:size] = "#{options[:size]}px" if options[:size].to_i.to_s == options[:size]
        options[:class] = Array(options[:class]).concat(['material-icons']).join(' ')
        options
      end

      def prep_icon_options(options)
        normalize_icon_options(merge_default_icon_options(options))
      end

      def build_icon_content_tag(icon, options)
        options = prep_icon_options(options)

        content_tag(options[:tag], icon, {
          class: options[:class],
          style: "font-size: #{options[:size]};",
        }) + options[:text]
      end


      def merge_default_icon_container_options(options)
        {
          tag: 'span',
          text: '',
        }.merge(options.symbolize_keys)
      end

      def normalize_icon_container_options(options)
        options[:class] = Array(options[:class]).concat(['material-icons-stack']).join(' ')
        options
      end

      def prep_icon_container_options(options)
        normalize_icon_container_options(merge_default_icon_container_options(options))
      end

      def build_icon_container_content_tag(icons, options)
        options = prep_icon_container_options(options)

        content_tag(
          options[:tag], 
          icons.collect do |icon, options|
            # add error message here
            raise ArgumentError unless options.is_a?(Hash)
            # ignore text per icon on a stack
            build_icon_content_tag(icon, options.except(:text))
          end.join.html_safe + options[:text],
          {
            class: options[:class],
            style: "font-size: #{options[:size]};",
          }
        )
      end

    end
  end
end