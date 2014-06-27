require 'nokogiri'
require 'open-uri'
require 'pry'

class MovieScraping

	def initialize
		html = open('http://www.fandango.com/moviesintheaters')
		@fandango = Nokogiri::HTML(html)
	end

	def scrape_data
		newMovies = @fandango.css(".movie-ls-group").first
		@movie_hash = {}
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
		@movie_hash
	end
end
