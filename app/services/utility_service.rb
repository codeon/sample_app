class UtilityService

  STOCK_EXPIRY_TIME = 1.minute

  class << self
    def get_stock_prices(stocks)
      # convert array to hash with ticker as key

      # stocks = [{:ticker => ".DJI", :exchange => "INDEXDJX"}]
      #
      #
      stock_data = stocks.inject({}) do |hash, stock|
        hash.merge!(stock[:ticker] => stock)
      end

      query = stocks.map do |stock|
        stock[:exchange] + ":" + stock[:ticker]
      end
      uri = URI.parse("https://finance.google.com/finance/info")
      uri.query = URI.encode_www_form({ q: query.join(",") })

      fresh_response = Net::HTTP.get_response(uri)
      if fresh_response.is_a?(Net::HTTPSuccess)
        # for some reason google's API returns result strating with `//`
        # https://finance.google.com/finance/info?q=INDEXDJX:.DJI,INDEXSP:.INX,INDEXNASDAQ:NDX
        google_data = JSON.parse(fresh_response.body[3..-1])

        google_data.each do |data|
          ticker = data["t"]
          stock_data[ticker][:value] = data["l_cur"]
          stock_data[ticker][:percentChange] = data["cp_fix"].to_f
          stock_data[ticker][:ltt] = data["ltt"]
          stock_data[ticker][:lt] = data["lt"]
          stock_data[ticker][:lt_dts] = data["lt_dts"]
          stock_data[ticker][:c] = data["c"]
        end
        JSON.parse(stock_data.values.to_json)
      end


    end
  end
end
