# encoding: utf-8
require "heading_with_title/version"
require "rails"
require "action_view"

# = HeadingWithTitle - A set of helpers for Rails
#
# Setting the page heading (e.g H1) at the same time with a page title (inside `<title>` tag).
#
# Add `page_title` call within `<title>` tag:
#
#  <title><%= page_title %></title>
#
# And then in the views you just call `heading_with_title` helper to set page title with
# heading, or you call `page_title('Something')` to set page title without heading.
#
# == Examples:
#
#  # Set both title and heading
#  <%= heading_with_title 'Users' %>
#
#  # It also respects a block
#  <%= heading_with_title 'Users' do |heading| %>
#    <span><%= heading %></span>
#  <% end %>
#
#  Or you might want to set only page title
#  <% page_title 'Users' %>
#
# == Configuration
# Create initializer file, `config/initializers/heading_with_title.rb` and put some
# configuration settings into it:
#
#  HeadingWithTitle.configure do |config|
#    # Set page title delimeter
#    # Example: Page Title / AwesomeApp
#    config.title_delimeter = ' / '
#
#    # Title suffix that shown at the end of page title
#    # Accepts String or Proc
#    config.title_suffix = ->{ Rails.application.name }
#
#    # Default heading size (h1 by default)
#    config.default_heading_size = :h1
#  end
#
module HeadingWithTitle
  # Set page title delimeter
  # Example: Page Title / AwesomeApp
  mattr_accessor :title_delimeter
  @@title_delimeter = ' / '

  # Title suffix that shown at the end of page title
  mattr_accessor :title_suffix
  @@title_suffix = ->{ Rails.application.name }

  # Default heading size (h1 by default)
  mattr_accessor :default_heading_size
  @@default_heading_size = :h1

  def self.configure
    yield self
  end

  require 'heading_with_title/railtie' if defined?(Rails)
end
