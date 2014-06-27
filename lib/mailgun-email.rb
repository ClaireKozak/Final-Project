require 'mailgun'
require './kickstarter_scraper'

class Email
	attr_accessor :api, :domain

	 # Initialize your Mailgun object:
	def initialize (api_key, domain)
	   @api = api_key
	   @domain  = domain
	end

	def configure_mailgun
		Mailgun.configure do |config| 
			config.api_key = api
			config.domain = domain
		end
	end

	def email_send(body)

		@mailgun = Mailgun()

		parameters = {
		  :to => "crk.pluto@gmail.com",
		  :subject => "New Movie Releases This Week",
		  :text => body,
		  :from => "postmaster@sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org"
		}
		@mailgun.messages.send_email(parameters)
	end
end

# hello = Email.new('key-1b0tr3-celzkwbwz5y0b7hnu90ngug-9', 'sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org')
# hello.configure_mailgun
# hello.email_send("TEST TEST TEST TEST TEST")



# def send_simple_message
#   RestClient.post "https://api:key-1b0tr3-celzkwbwz5y0b7hnu90ngug-9"\
#   "@api.mailgun.net/v2/sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org/messages",
#   :from => "Mailgun Sandbox <postmaster@sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org>",
#   :to => "Claire Kozak <crk.pluto@gmail.com>",
#   :subject => "Hello Claire Kozak",
#   :text => "Congratulations Claire Kozak, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
# end


# config.api_key = 'key-1b0tr3-celzkwbwz5y0b7hnu90ngug-9'
# config.domain  = 'sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org'