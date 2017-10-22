class Scraping
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  # 1.リクルートジョブス
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.jobs
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://techblog.recruitjobs.net")
    elements = current_page.search('.thumb-holder a')
    elements.each do |ele|
      links << ele[:href]
    end
    
    links.each do |link|
      if !Blog.find_by(url: link).present? && !link.include?("category")
        get_jobs(link)
      end
    end
  end

  def self.get_jobs(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.h1-wrapper').inner_text.strip
    image = page.search('.post-content img')[2][:src]
    postday = page.at('.pull-left').inner_text.strip.split(" ").first

    Blog.create(company: "リクルートジョブズ", url: link, title: title, image: image, postday: postday)
  end

  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  # 2.リクルートライフスタイル
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.lifestyle
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://engineer.recruit-lifestyle.co.jp/techblog/")
    elements = current_page.search('.rls-box01')
    elements.each do |ele|
      links << ele[:href]
    end
    
    links.each do |link|
      get_lifestyle('http://engineer.recruit-lifestyle.co.jp' + link)
    end
  end

  def self.get_lifestyle(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.rls-a-article__title').inner_text.strip

    Blog.create(company: "リクルートライフスタイル", title: title, url: link)
  end

  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  # 3.リクルート住まいカンパニー
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.sumai_company
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://tech.recruit-sumai.co.jp")
    elements = current_page.search('.entry-title a')
    elements.each do |ele|
      links << ele[:href]
    end
    
    links.each do |link|
      get_sumai_company(link)
    end
  end

  def self.get_sumai_company(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.bookmark').inner_text.strip

    Blog.create(company: "リクルート住まいカンパニー", title: title, url: link)
  end

  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  # 4.リクルートマーケティングパートナーズ
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.marketing_partners
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://tech.recruit-mp.co.jp")
    elements = current_page.search('.widget__title a')
    elements.each do |ele|
      links << ele[:href]
    end
    
    links.each do |link|
      get_marketing_partners(link)
    end
  end

  def self.get_marketing_partners(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('#article-title').inner_text.strip

    Blog.create(company: "リクルートマーケティングパートナーズ", title: title, url: link)
  end

  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  # 5.テクノロジーズ
  # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.technologies
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://recruit-tech.co.jp/blog/")
    elements = current_page.search('.article-left a')
    elements.each do |ele|
      links << ele[:href]
    end
    
    links.each do |link|
      get_technologies(link)
    end
  end

  def self.get_technologies(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.article-title').inner_text.strip

    Blog.create(company: "リクルートテクノロジーズ", title: title, url: link)
  end
end
