class Scraping
  def self.recruit_lifestyle
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://engineer.recruit-lifestyle.co.jp/techblog/")
    elements = current_page.search('.rls-box01')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_product('http://engineer.recruit-lifestyle.co.jp' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    # image = page.at('.rls-p-eyecatch rls-p-eyecatch__article')[:url]
    title = page.at('.rls-a-article__title').inner_text.strip
    url = link
    # image_url = page.at('.pictBox img')[:src]
    
    blog = Blog.create(image: image, title: title, url: url)
    blog.save
  end
end

    # images = page.search('.rls-box01__image')
    # images.each do |image|
    #   recruit_lifestyle_image = 'http://engineer.recruit-lifestyle.co.jp' + image.get_attribute('src')
    #   blog = Blog.new(image: recruit_lifestyle_image)
    #   blog.save
    # end