require 'nokogiri'
require 'webdrivers/chromedriver'
require 'watir'

class Scraper < ApplicationRecord
  def self.call(url)
    self.get_url(url)
  end

  def self.get_url(url)
    doc = HTTParty.get(url)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto(url)
    parsed_page ||= Nokogiri::HTML.parse(browser.html)
    answer = parsed_page.css('h1#isit').text
    self.check_text(answer)
  end

  def self.check_text(data)
    if data == '' || data == nil
      puts "There was no text received from the web scrape."
      exit
    else
      puts "There was data in the text received from the web scrape."
      self.store_text(data)
    end
  end

  def self.store_text(text)
    record = DiffStorage.new
    record.website_data = text
    if record.save
      puts "Record Updated Successfully"
    end
    return record
  end
end