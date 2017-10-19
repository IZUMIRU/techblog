class Scraping
  # ライフスタイル
  def self.recruit_lifestyle
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://engineer.recruit-lifestyle.co.jp/techblog/")
    elements = current_page.search('.rls-box01')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_lifestyle('http://engineer.recruit-lifestyle.co.jp' + link)
    end
  end

  def self.get_lifestyle(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.rls-a-article__title').inner_text.strip

    blog = Blog.create(company: "ライフスタイル", title: title, url: link)
  end

  # マーケティングパートナーズ
  def self.marketing_partners
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://tech.recruit-mp.co.jp/")
    elements = current_page.search('.widget__title a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_marketing_partners(link)
    end
  end

  def self.get_marketing_partners(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('#article-title').inner_text.strip

    blog = Blog.create(company: "マーケティングパートナーズ", title: title, url: link)
  end







end
