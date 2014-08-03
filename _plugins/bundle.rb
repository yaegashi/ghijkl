require "rubygems"
require "bundler/setup"
Bundler.require(:default)
require "jekyll-assets/bootstrap"

Haml::Options.defaults[:format] = :xhtml
