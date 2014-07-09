require 'rails_helper'

RSpec.describe Article, :type => :model do

  it 'loads html page' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
  end


  pending 'parses article' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
    Article.parse_from_zive(html)
  end
end
