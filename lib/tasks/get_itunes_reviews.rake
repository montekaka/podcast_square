# encoding: UTF-8
desc "Get podcast review from iTunes"
task :get_itunes_reviews => :environment do	
	Podcast.all.each do |podcast|
		podcast_reviews = []
		itunes_id = podcast.itunes_id 
		Country.all.each do |country|
			base_url = "https://itunes.apple.com/#{country.country_code}/rss/customerreviews/id=#{itunes_id}/sortBy=mostRecent/json"
			response = HTTParty.get(base_url)
			if response && response.parsed_response		
				json_response = JSON.parse(response.parsed_response)
				if json_response["feed"]["entry"] && json_response["feed"]["entry"].length > 1
					reviews = json_response["feed"]["entry"]
					reviews.shift # remove the first element that has nothing to do with reviews
					reviews.each do |review|
						author = review["author"]["name"]["label"]
						rating = review["im:rating"]['label'].to_f
						title = review["title"]['label']
						content = review["content"]['label']
						review_itunes_id = review["id"]["label"]
						user_review = { review_itunes_id: review_itunes_id, author: author, rating: rating, title: title, content: content, country_code: country.country_code, podcast_id: podcast.id }
						podcast_reviews.push(user_review)
					end				
				end
			end			
			if podcast_reviews.length > 0 
				Review.create(podcast_reviews)
			end
		end
	end


	# base_url = 'https://itunes.apple.com/us/rss/customerreviews/id=826420969/sortBy=mostRecent/json'	
	# response = HTTParty.get(base_url)
	# json_response = JSON.parse(response.parsed_response)
	# # How to get rss feed from itunes
	# #base_url = 'https://itunes.apple.com/lookup?id=1050462261'
	# #p json_response["results"][0]['feedUrl']

	# # Get reviews
	# reviews = json_response["feed"]["entry"]
	# if reviews.length > 1 
	# 	reviews.shift # remove the first element that has nothing to do with reviews
	# 	reviews.each do |review|
	# 		author = review["author"]["name"]["label"]
	# 		rating = review["im:rating"]['label'].to_f
	# 		title = review["title"]['label']
	# 		content = review["content"]['label']
	# 		user_review = { author: author, rating: rating, title: title, content: content }
	# 	end
	# end
end