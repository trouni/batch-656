require 'open-uri'
require 'nokogiri'

def fetch_top_5_movie_urls
  html_file = URI.open('https://www.imdb.com/chart/top').read
  doc = Nokogiri::HTML(html_file)

  doc.search('.titleColumn a').first(5).map do |element|
    "https://www.imdb.com#{element.attributes['href'].value}"
  end
end

def scrape_movie_info(url)
  html_file = URI.open(url, 'Accept-Language' => 'en').read
  doc = Nokogiri::HTML(html_file)

  cast = doc.search('.StyledComponents__ActorName-y9ygcu-1').first(3).map { |el| el.text.strip }
  director = doc.search('.ipc-metadata-list-item__list-content-item').first.text.strip
  storyline = doc.search('.iywpty .ipc-html-content.ipc-html-content--base').text.strip
  # title = doc.search('.TitleHeader__TitleText-sc-1wu6n3d-0').text.strip => returns "Dâku naito"
  title = doc.search('.OriginalTitle__OriginalTitleText-jz9bzr-0').text.strip.gsub('Original title: ', '')
  year = doc.search('.TitleBlockMetaData__ListItemText-sc-12ein40-2').text.strip.to_i

  { cast: cast, director: director, storyline: storyline, title: title, year: year }
end
