class CurrencyConverter

	def self.get_value
		response = RestClient::Request.execute(
            method: :get,
            url: 'https://api.exchangeratesapi.io/latest?symbols=KRW'
        )
        value = JSON.parse(response)["rates"]["KRW"]
        value
	end


	@@daily_currency_rate = Rails.cache.fetch('daily_currency_rate', expires_in: 5.minutes) do |variable|
        CurrencyConverter.get_value
    end

    attr_reader :daily_currency_rate

end
