# encoding: utf-8
require 'heading_with_title/helpers'

module HeadingWithTitle
  class Railtie < Rails::Railtie
    initializer 'heading_with_title.helpers' do |app|
      ActionView::Base.send :include, HeadingWithTitle::Helpers
    end
  end
end
