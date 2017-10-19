class Scraping
  def self.recruit_lifestyle
    agent = Mechanize.new
    page = agent.get("http://engineer.recruit-lifestyle.co.jp/techblog/")

    # images = page.search('.rls-box01__image')
    # images.each do |image|
    #   recruit_lifestyle_image = 'http://engineer.recruit-lifestyle.co.jp' + image.get_attribute('src')
    #   blog = Blog.new(image: recruit_lifestyle_image)
    #   blog.save
    # end
    
    titles = page.search('.rls-box01__description')
    titles.each do |title|
      recruit_lifestyle_title = title.inner_text.strip

      urls = page.search('.rls-box01')
      urls.each do |url|
        recruit_lifestyle_url = 'http://engineer.recruit-lifestyle.co.jp' + url.get_attribute('href')

        Blog.create(title: recruit_lifestyle_title, url: recruit_lifestyle_url) unless Blog.first.url.present?
      end
    end
  end
end



# def self.movie_urls
#     links = []
#     agent = Mechanize.new
#     current_page = agent.get("http://eiga.com/now/")
#     elements = current_page.search('.m_unit h3 a')
#     elements.each do |ele|
#         links << ele.get_attribute('href')
#     end
    
#     links.each do |link|
#         get_product('http://eiga.com' + link)
#     end
# end

# def self.get_product(link)
#     agent = Mechanize.new
#     page = agent.get(link)
#     title = page.at('.moveInfoBox h1').inner_text
#     image_url = page.at('.pictBox img')[:src]
    
#     product = Product.new(title: title, image_url: image_url)
#     product.save
# end