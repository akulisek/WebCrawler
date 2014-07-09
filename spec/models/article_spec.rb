require 'rails_helper'

RSpec.describe Article, :type => :model do

  it 'loads html page' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
  end

  it  'parses article' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
    Article.parse_from_zive(html)
  end

  it 'article is not null' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
    Article.parse_from_zive(html)
    expect(Article.count).not_to eq(0)
  end

  it 'parses data correctly' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/zive_page.html', encoding: 'utf-8')
    Article.parse_from_zive(html)

    article = Article.first
    article.title = article.title.strip
    article.perex = article.perex[/[^\t\n]*/]

    expect(article.title).to eq('Vylepšujeme si prehliadače: Tipy na užitočné rozšírenia')
    expect(article.perex).to eq("Prinášame výber šikovných rozšírení, ktorými si môžete doplniť prehliadače Chrome, Firefox i Opera.")
    expect(article.zive_id).to eq(97000)
  end

end
