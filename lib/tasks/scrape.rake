require "nokogiri"
require "open-uri"

namespace :scrape do

	task :sample_title => :environment do

 	# スクレイピング先のURL
		url = 'http://honz.jp/category/review'

		charset = nil
		html = open(url) do |f|
		  charset = f.charset # 文字種別を取得
		  f.read # htmlを読み込んで変数htmlに渡す
		end

				# htmlをパース(解析)してオブジェクトを生成
		doc = Nokogiri::HTML.parse(html, nil, charset)

				# タイトルを表示
		p doc.title

		#body要素の中を取得
		
			doc.xpath("//div[@id='list_content']/div[@class='body']/ul/li").each do |node|  #eachメソッド開始
				title=node.xpath(".//div[@class='img book']/a/img").attribute("alt").value
				image_url= node.xpath(".//div[@class='img book']/a/img").attribute("src").value
				book = Book.where(title: title).first_or_initialize(
				title: title,
				image_url: image_url
				)
				book.save
				
			end #eachメソッド終了
	end
end
