class Stock < ActiveRecord::Base
  
  def self.new_from_lookup ticker_symbol
    begin
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.l.gsub(",",""))
    rescue Exception => e
      return nil
    end
  end
end
