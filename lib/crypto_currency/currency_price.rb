class CryptoCurrency::Currency_price
  attr_accessor :name, :price, :marketcap, :url


  def self.all
    self.scarpe_coinmarketcap
  end

  def self.scarpe_coinmarketcap
    currencies = []
    currencies << self.scraper_currecies

    currencies # returns a array with name, price and marketcap data
  end


   def self.scraper_currecies
     doc = Nokogiri::HTML(open("https://coinmarketcap.com"))

     currency = self.new #initialize new currency
     currency.name = doc.css("td.currency-name a").map{|a| a.text} # returning an array instead of a string
     currency.price = doc.css("td.no-wrap a.price").map{|a| a.text}
     currency.marketcap = doc.css("td.market-cap").map{|marketcap| marketcap.text.strip}

     currency
   end
end
#CryptoCurrency::Currency_price.scarpe_coinmarketcap
#CryptoCurrency::Currency_price.scraper_currecies
#{@currencies[0]}  "" #{@prices[0]}  " " #{@mprices[0]}"



#  def self.scarpe_coinmarketcap
#    doc = Nokogiri::HTML(open("https://coinmarketcap.com"))
#    doc.css("#bitcoin").each do |data|
#      currecy = self.new # initialize new currency
#      currecy.name = doc.css("td.currency-name a").text
#      currecy.price = doc.css("#td.no-wrap a.price").text
#      currecy.marketcap = doc.css("td.market-cap").text.strip
#      binding.pry
#      currecy
#    end
#  end
