require "rubygems"
require "bundler/setup"
Bundler.require(:default)

Haml::Options.defaults[:format] = :xhtml
Sprockets.append_path Bootstrap.stylesheets_path
Sprockets.append_path Bootstrap.javascripts_path
Sprockets.append_path Bootstrap.fonts_path
