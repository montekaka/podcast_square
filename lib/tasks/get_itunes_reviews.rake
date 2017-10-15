# encoding: UTF-8
desc "Get podcast review from iTunes"
task :get_itunes_reviews => :environment do
	base_url = 'https://itunes.apple.com/us/rss/customerreviews/id=826420969/sortBy=mostRecent/json'	
	response = HTTParty.get(base_url)
	json_response = JSON.parse(response.parsed_response)
	# How to get rss feed from itunes
	#base_url = 'https://itunes.apple.com/lookup?id=826420969'
	#p json_response["results"][0]['feedUrl']

	# Get reviews
	reviews = json_response["feed"]["entry"]
	if reviews.length > 1 
		reviews.shift # remove the first element that has nothing to do with reviews
		reviews.each do |review|
			author = review["author"]["name"]["label"]
			rating = review["im:rating"]['label'].to_f
			title = review["title"]['label']
			content = review["content"]['label']
			user_review = { author: author, rating: rating, title: title, content: content }
			p user_review
		end
	end
end