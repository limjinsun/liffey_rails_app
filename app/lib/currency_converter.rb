class CurrencyConverter

	def self.get_value
		response = RestClient::Request.execute(
            method: :get,
            url: 'https://api.exchangeratesapi.io/latest?symbols=KRW'
        )
        value = JSON.parse(response)["rates"]["KRW"]
        value
	end

end
