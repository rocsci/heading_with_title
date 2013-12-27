# encoding: utf-8
module HeadingWithTitle
  module Helpers #:nodoc:
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

    def heading_with_title(arg = nil, &block)
      heading = case arg
      when NilClass
        t(HeadingWithTitle.default_i18n_key)
      when Hash
        t(HeadingWithTitle.default_i18n_key, arg)
      when String
        arg
      else
        raise ArgumentError, 'Incorrect arguments for heading_with_title!'
      end

      page_title(heading)
      heading = raw(block.call(heading)) if block_given?
      content_tag(HeadingWithTitle.default_heading_size, heading)
    end
  end
end
