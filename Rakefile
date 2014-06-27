require 'nokogiri'
require 'mailgun'
require 'open-uri'
require './lib/mailgun-email'
require './lib/kickstarter_scraper'

task :moviescraping do
	movies = MovieScraping.new
	movies.scrape_data
	body = movies.make_message
	message = Email.new('key-1b0tr3-celzkwbwz5y0b7hnu90ngug-9', 'sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org')
	message.configure_mailgun
	message.email_send(body)

end