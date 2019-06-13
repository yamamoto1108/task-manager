class Scraping
  def self.get_image
    agent = Mechanize.new
    page = agent.get("https://www.playearth10.com/wall-paper")
    images = page.search('.aligncenter img')
    images.each do |image|
      image = image[:src]
      background = Background.new(image: image)
      background.save
    end
  end
end
