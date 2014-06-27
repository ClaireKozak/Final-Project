require 'nokogiri'
require 'open-uri'


class MovieScraping
	attr_accessor :movie_hash

	def initialize
		html = open('http://www.fandango.com/moviesintheaters')
		@fandango = Nokogiri::HTML(html)
		@movie_hash = {}
	end

	def scrape_data
		newMovies = @fandango.css(".movie-ls-group").first
		newMovies.css(".visual-item").each do |movie|
			# binding.pry
			title = movie.css(".visual-title").text.strip
			@movie_hash[title] = {
				:movie_title => movie.css(".visual-title").text.strip,
				:release_date => movie.css(".visual-sub-title").text,
				:movie_image => movie.css("img")[0]["src"],
				:link =>movie.css(".visual-container")[0]["href"]
		}
		end
	end

	def make_message
		message = "<html><body>"
		movie_hash.each do |movietitle, moviedata|
			message += "#{moviedata[:movie_title]} - #{moviedata[:release_date]}
			#{moviedata[:movie_image]}
			#{moviedata[:link]}

			"
		end
		message += "</body></html>"
	end

end