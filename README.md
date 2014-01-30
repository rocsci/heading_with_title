# HeadingWithTitle - A set of helpers for Rails

Setting the page heading (e.g H1) at the same time with a page title (inside `<title>` tag).

## Installation

First, put this line in your `Gemfile`:

```ruby
gem 'heading_with_title'
```

Then run `bundle install` to update your application's bundle.

## Usage

Add `page_title` call within `<title>` tag:

```erb
<title><%= page_title %></title>
```

And then in the views you just call `heading_with_title` helper to set page title with
heading, or you call `page_title('Something')` to set page title without heading.

## Examples:
```erb
# Set both title and heading
<%= heading_with_title 'Users' %>

# It also respects a block
<%= heading_with_title 'Users' do |heading| %>
  <span><%= heading %></span>
<% end %>

# You can also call it without arguments. In this case
# it will use I18n Lazy Lookup (http://guides.rubyonrails.org/i18n.html#lazy-lookup)
# with key defined by `default_i18n_key` setting.
<%= heading_with_title %>

# If you need to use I18n Interpolation (http://guides.rubyonrails.org/i18n.html#interpolation)
# just pass hash as argument:
<%= heading_with_title username: 'John Doe' %>

# Also it accepts ActiveRecord model instance
<% heading_with_title Product.find(777) %>

# Or you might want to set only page title
<% page_title 'Users' %>

```
## Configuration

Create initializer file, `config/initializers/heading_with_title.rb` and put some
configuration settings into it:
```ruby
HeadingWithTitle.configure do |config|
  # Set page title delimeter
  # Example: Page Title / AwesomeApp
  config.title_delimeter = ' / '

  # Title suffix that shown at the end of page title
  # Accepts String or Proc
  config.title_suffix = ->{ Rails.application.class.parent_name }

  # Default heading size (h1 by default)
  config.default_heading_size = :h1

  # Default I18n key when call heading_with_title
  # helper without arguments
  # Its the same as:
  #
  #  heading_with_title t('.heading')
  #
  config.default_i18n_key = '.heading'
end
```

## License

[The MIT License](https://github.com/tanraya/heading_with_title/blob/master/MIT-LICENSE)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rocsci/heading_with_title/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

