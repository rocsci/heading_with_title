# encoding: utf-8
require "heading_with_title/version"

=begin
HeadingWithTitle.configure do |config|
  config.delimeter = '/'
  config.default_title = 'Default title'
end

# Set page title
<% page_title 'Users' %>

# Output page title
<%= page_title %>

# Output heading with title
<%= heading_with_title 'Users' %>

# Output heading with title
<%= heading_with_title 'Users' do %>
  <span><%= yield %></span>
<% end %>

=end

module HeadingWithTitle
  mattr_accessor :title_delimeter
  @@title_delimeter = ' / '

  mattr_accessor :title_suffix
  @@title_suffix = ->{ Rails.application.name }

  mattr_accessor :default_heading_size
  @@default_heading_size = :h1

  def self.configure
    yield self
  end

  require 'heading_with_title/railtie' if defined?(Rails)
end
