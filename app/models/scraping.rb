class Scraping
  # ライフスタイル
  def self.lifestyle
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

    Blog.create(company: "ライフスタイル", title: title, url: link)
  end

  # マーケティングパートナーズ
  def self.marketing_partners
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://tech.recruit-mp.co.jp")
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

    Blog.create(company: "マーケティングパートナーズ", title: title, url: link)
  end

  # テクノロジーズ
  def self.technologies
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://recruit-tech.co.jp/blog/")
    elements = current_page.search('.article-left a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_technologies(link)
    end
  end

  def self.get_technologies(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.article-title').inner_text.strip

    Blog.create(company: "テクノロジーズ", title: title, url: link)
  end

  # 住まいカンパニー
  def self.sumai_company
    links = []
    agent = Mechanize.new
    current_page = agent.get("http://tech.recruit-sumai.co.jp")
    elements = current_page.search('.entry-title a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_sumai_company(link)
    end
  end

  def self.get_sumai_company(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.bookmark').inner_text.strip

    Blog.create(company: "住まいカンパニー", title: title, url: link)
  end

  # ジョブス
  def self.jobs
    links = []
    agent = Mechanize.new
    current_page = agent.get("https://techblog.recruitjobs.net")
    elements = current_page.search('.thumb-holder a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end
    
    links.each do |link|
      get_jobs(link)
    end
  end

  def self.get_jobs(link)
    agent = Mechanize.new
    page = agent.get(link)
    # title = page.at('.h1-wrapper').inner_text.strip

    Blog.create(company: "ジョブズ", url: link)
  end








end
