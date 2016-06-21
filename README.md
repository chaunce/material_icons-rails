material_icons-rails
===========

Google Material Icons font assets and form helpers

Usage
--------

add `material_icons-rails` to your `Gemfile`

    gem 'material_icons-rails'

Add to `material-icons` to your `application.css`

     *= require material-icons

use a form helper in a view

    material_icon(:face)
    material_icon(:face, class: 'one-in-your-own-css and-another')
    material_icon(:face, class: 'red', tag: 'span')

valid options

  `:size` a string for `font-size`, an integer for `px`, `1x` - `4x` for pre-defined sizes
