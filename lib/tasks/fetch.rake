namespace :fetch do
  desc 'Fetch Digiato articles'
  task digiato: :environment do
    puts 'Start fetching'
    begin
      source = Source.find_by! name: 'digiato'
      user = User.find(1)
      puts "Fetching #{source.home_page_url}"
      doc = Nokogiri::HTML(URI.open(source.home_page_url))
      doc.css(source.home_entry_css).each do |link|
        next if Article.find_by(url: link['href'])

        puts 'Creating article'
        article = Article.new
        article.url = link['href']
        puts "Getting article #{link['href']}"
        doc_article = Nokogiri::HTML(URI.open(link['href']))
        puts 'Get title of article'
        doc_article.css(source.title_css).each do |title|
          article.title = title.content
        end
        puts 'Get image of article'
        doc_article.css(source.img_css).each do |img|
          article.img_url = img['data-src']
        end
        puts 'Get intro of article'
        doc_article.css(source.intro_text_css).each do |text|
          article.intro_text = text.content
        end
        article.source = source
        article.user = user
        article.save

        if article.errors.any?
          article.errors.full_messages.each do |message|
            puts message
          end
        end
        sleep 5
      end
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end

  desc 'Fetch Zoomit articles'
  task zoomit: :environment do
    puts 'Start fetching'
    begin
      source = Source.find_by! name: 'zoomit'
      user = User.find(1)
      puts "Fetching #{source.home_page_url}"
      doc = Nokogiri::HTML(URI.open(source.home_page_url))
      doc.css(source.home_entry_css).each do |link|
        next if Article.find_by(url: link['href'])

        puts 'Creating article'
        article = Article.new
        article.url = link['href']
        puts "Getting article #{link['href']}"
        doc_article = Nokogiri::HTML(URI.open(link['href']))
        puts 'Get title of article'
        doc_article.css(source.title_css).each do |title|
          article.title = title.content
        end
        puts 'Get image of article'
        doc_article.css(source.img_css).each do |img|
          article.img_url = img['src']
        end
        puts 'Get intro of article'
        doc_article.css(source.intro_text_css).each do |text|
          article.intro_text = text.content
        end
        article.source = source
        article.user = user
        article.save

        if article.errors.any?
          article.errors.full_messages.each do |message|
            puts message
          end
        end
        sleep 5
      end
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end
end
