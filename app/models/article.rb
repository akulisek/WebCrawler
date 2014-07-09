class Article < ActiveRecord::Base
  #belongs_to :author

  def self.parse_from_zive(html)
    doc = Nokogiri::HTML.parse(html)

    doc.search('.articlesListItem .articlesListItemData').map do |div|
      anchor = div.search('.articleTitle a').first
      Article.create!(
          zive_id: anchor[:href][/\/(\d+)\//, 1].to_i,
          title: anchor.text,
          perex: div.search('p').text
      )
    end

  end

end
