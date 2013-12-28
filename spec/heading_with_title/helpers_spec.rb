# encoding: utf-8
require "heading_with_title"

module HeadingWithTitle
  module Helpers #:nodoc:
    def t(*args)
      I18n.t(*args)
    end
  end
end

describe HeadingWithTitle::Helpers do
  include ActionView::Helpers
  include HeadingWithTitle::Helpers

  before do
    Rails.stub_chain(:application, :class, :parent_name).and_return('AwesomeApp')
  end

  describe '.page_title' do
    it 'sets a page title' do
      page_title('Something')
      page_title.should == 'Something / AwesomeApp'
    end

    it 'respects delimeter' do
      HeadingWithTitle.title_delimeter = ' - '
      page_title('Something')
      page_title.should == 'Something - AwesomeApp'
    end

    it 'returns nil when set an page title' do
      page_title('Something').should be_nil
    end
  end

  describe '.heading_with_title' do
    before { HeadingWithTitle.title_delimeter = ' / ' }

    it 'renders default h1 heading' do
      heading_with_title('Users').should == '<h1>Users</h1>'
    end

    it 'sets an page title' do
      heading_with_title('Users')
      page_title.should == 'Users / AwesomeApp'
    end

    it 'applies block' do
      result = heading_with_title 'Users' do |heading|
        "<span>" + heading + "</span>"
      end

      result.should == '<h1><span>Users</span></h1>'
    end

    it 'respects heading size' do
      HeadingWithTitle.default_heading_size = :h2
      heading_with_title('Users').should == '<h2>Users</h2>'
    end

    it 'uses I18n when called without args' do
      HeadingWithTitle.default_heading_size = :h1
      heading_with_title.should == '<h1>translation missing: en.heading</h1>'
    end

    it 'allows hash as arguments (I18n interpolation)' do
      I18n.backend.store_translations :en, heading: 'Hello %{name}!'
      heading_with_title(name: 'John Doe').should == '<h1>Hello John Doe!</h1>'
    end

    it 'raises ArgumentError on incorrect arguments' do
      expect { heading_with_title(OpenStruct.new(name: 'Weird')) }.to raise_error(ArgumentError, 'Incorrect arguments for heading_with_title!')
    end
  end
end
