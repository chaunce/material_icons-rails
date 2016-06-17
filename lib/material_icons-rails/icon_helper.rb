module MaterialIcons
  module Rails
    module IconHelper
      def material_icon(names, options = {})
        options = { tag: 'i' }.merge(options.symbolize_keys)
        content_tag(options[:tag], names, { class: Array(options[:class]).concat(['material-icons']).join(' ') })
      end
    end
  end
end