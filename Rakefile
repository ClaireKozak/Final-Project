require 'nokogiri'
require 'mailgun'
require 'open-uri'
require './mailgun-email'
require './kickstarter_scraper'

task :moviescraping
	scrape = MovieScraping.new
	movies = scrape.scrape_data
	message = Email.new('key-1b0tr3-celzkwbwz5y0b7hnu90ngug-9', 'sandbox9679075790ab4fd39af23f7c7a4372fa.mailgun.org')
	message.email_send(movies)