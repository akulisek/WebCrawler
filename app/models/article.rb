class Article < ActiveRecord::Base
  belongs_to :author

  def self.parse_from_zive(html)
    doc = Nokogiri::HTML.parse(html)

    doc.search('.articlesListItem .articlesListItemData').map do |div|
      anchor = div.search('.articleTitle a').first
      Article.create!(
          zive_id: anchor[:href][/\/(\d+)\//, 1].to_i,
          title: anchor.text[0..254].strip,
          perex: div.search('.articlePerex').text.split("\t\t\t\t",3)[2].strip
      # got: "\n\t\t\t\tVideo\t\t\t\t Prinášame výber šikovných rozšírení, ktorými si môžete doplniť prehliadače Chrome, Firefox i Opera.\t\t\t"

      )
    end

  end

end
