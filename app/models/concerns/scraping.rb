require "nokogiri"
require "open-uri"

def Scraping
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
	#p doc.xpath("///ul/li[@class='num_1']/div[@class='txt']/p").text

	book.title= doc.xpath("///ul/li[@class='num_1']/div[@class='img book']/a/img").attribute("alt").value

	book.image_url= doc.xpath("///ul/li[@class='num_1']/div[@class='img book']/a/img").attribute("src").value
end