class DiffStorage < ApplicationRecord
  def self.url
    'https://isittheweekend.com/'
  end

  def self.check_last_record
    today_answer = Scraper.call(self.url)
    if DiffStorage.any?
      yesterday_answer = DiffStorage.last
    else
      yesterday_answer = ''
    end
    Messenger.send_update_message(Recipient.all, yesterday_answer, today_answer)
  end  
end
