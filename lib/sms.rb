require 'twilio-ruby'

class Sms

account_sid = 'AC94b4ffbae5e8af03a905186d78282c2b'
auth_token = '87daaf5c1e647a7a6cbe8a6cc3afb79a'
client = Twilio::REST::Client.new(account_sid, auth_token)
from = '+447481346381' # Twilio number
to = '+447500*****' 

  def initialize(client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
    @client = client
    @from = ENV['TWILIO_PHONE']
    @to = ENV['TWILIO_DESTINATION_PHONE']
  end

  def send
    @client.messages.create(message_arguments)
    "Message sent"
  end


private

def message_arguments
   {
     body: "Thank you for your order. It should be with you by #{time}",
     to: ENV['MY_PHONE_NUMBER'],
     from: ENV['TWILIO_PHONE_NUMBER']
   }
 end

 def time
   time = Time.now + 3600
   "#{time.hour}:#{time.min}"
 end

end
