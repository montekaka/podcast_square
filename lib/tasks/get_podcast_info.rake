# encoding: UTF-8
desc "Get podcast description"
task :get_itunes_podcast_desc => :environment do	
	Podcast.all.each do |podcast|
		itunes_id = podcast.itunes_id 		
		base_url = "https://itunes.apple.com/lookup?id=#{itunes_id}"
		response = HTTParty.get(base_url)
		json_response = JSON.parse(response.parsed_response)
		rss_feed = json_response["results"][0]['feedUrl']
		track_name = json_response["results"][0]['trackName']
		podcast.rss_feed = rss_feed
		podcast.name = track_name
		podcast.save
	end
end