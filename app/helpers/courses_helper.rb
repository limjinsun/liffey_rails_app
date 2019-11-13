require 'json'
require 'nokogiri'
require 'open-uri'

module CoursesHelper

    include ActionView::Helpers::NumberHelper

    def convert_euro_to_won(euroPrice)
        response = RestClient::Request.execute(
            method: :get,
            url: 'https://api.exchangeratesapi.io/latest?symbols=KRW'
        )
        won = JSON.parse(response)["rates"]["KRW"]
        wonPrice = won * euroPrice
        number_to_currency(wonPrice.round(-4))
    end

    def get_facebook_post(fbname)
        doc = Nokogiri::HTML(open('https://www.facebook.com/pg/' + fbname + '/posts/'))
        result = doc.xpath('/html/body/div[1]/div[3]/div[1]/div/div/div[2]/div[2]/div/div[2]/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[2]/div[2]/form/input[3]')
        postid = result.attr("value")
        postString = "https://www.facebook.com/" + fbname + "/posts/" + postid
        postString
    end

    # def get_insta_posts
    #     doc = Nokogiri::HTML(open('https://www.instagram.com/liffeydublin/'))
    #     result = doc.xpath('/html/body/script[1]/text()')
    #     string = result.to_s
    #     string = string.delete_prefix("window._sharedData = ")
    #     puts doc
    # end

end
