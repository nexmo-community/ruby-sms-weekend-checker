class Messenger < ApplicationRecord
  @client = Vonage::Client.new(
    api_key: ENV['VONAGE_API_KEY'],
    api_secret: ENV['VONAGE_API_SECRET']
  )

  def self.send_update_message(recipients, yesterday, today)
    puts "Sending Message to Each Recipient"
    recipients.each do |recipient|
      if recipient.subscribed
        @client.sms.send(
          from: ENV['FROM_NUMBER'],
          to: recipient.number,
          text: self.weekend_message(yesterday, today)
        )
        puts "Sent message to #{recipient.number}"
      end
    end
  end

  def self.weekend_message(yesterday, today)
    if today == yesterday
      response = "Today is the same as yesterday, and the answer is #{today}."
    elsif today =! yesterday
      response = "Today is not the same as yesterday, the answer for today is #{today}."
    else
      response = 'Today and yesterday are both neither affirmative or positive. Are we in an alternative dimension of time and space?'
    end
    self.compose_message(response)
  end

  def self.compose_message(response)
    <<~HEREDOC
    Hello! 
    It is a new day, but is it a weekend day?
    #{response} 
    To be removed from the list please respond with "1".
    HEREDOC
  end

  def self.send_removal_message(to)
    @client.sms.send(
      from: ENV['FROM_NUMBER'],
      to: to,
      text: 'You have been successfully removed.'
    )
  end
end
