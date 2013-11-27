# encoding: utf-8
require "heading_with_title"

describe HeadingWithTitle::Helpers do
  include ActionView::Helpers
  include HeadingWithTitle::Helpers

  before { Rails.stub_chain(:application, :name).and_return('AwesomeApp') }

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
  end
end
