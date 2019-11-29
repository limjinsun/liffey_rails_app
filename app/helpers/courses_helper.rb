require 'json'
require 'nokogiri'
require 'open-uri'

module CoursesHelper

    include ActionView::Helpers::NumberHelper

    def convert_euro_to_won(euro_price)
        daily_currency = Rails.cache.fetch('daily_currency', expires_in: 12.hours) do
            CurrencyConverter.get_value
        end
        won_price = daily_currency * euro_price
        number_to_currency(won_price.round(-2))
    end

end
