# encoding: utf-8
module HeadingWithTitle
  module Helpers
    # Set page title. Use this method in your views
    def page_title(title = nil)
      if title.present?
        @hwt_title = title
        nil
      else
        suffix = HeadingWithTitle.title_suffix
        suffix = suffix.call if suffix.is_a?(Proc)
        raw ([@hwt_title, suffix].compact.join(HeadingWithTitle.title_delimeter))
      end
    end

    def heading_with_title(heading, &block)
      page_title(heading)
      heading = raw(block.call(heading)) if block_given?
      content_tag(HeadingWithTitle.default_heading_size, heading)
    end
  end
end
