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

    # def get_facebook_post(fbname)
    #     doc = Nokogiri::HTML(open('https://www.facebook.com/pg/' + fbname + '/posts/'))
    #     result = doc.xpath('/html/body/div[1]/div[3]/div[1]/div/div/div[2]/div[2]/div/div[2]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[2]/div[2]/form/input[3]')
    #     postid = result.attr("value")
    #     postString = "https://www.facebook.com/" + fbname + "/posts/" + postid
    #     puts postString
    #     postString
    # end

end

