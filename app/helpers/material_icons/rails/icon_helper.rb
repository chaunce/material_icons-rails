module MaterialIcons
  module Rails
    module IconHelper
      def material_icon(icon, options = {})
        MaterialIcon.new(icon, options).to_html
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
        MaterialIconStack.new(icons, stack_options).to_html
      end

    end
  end
end
