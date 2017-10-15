# encoding: UTF-8
require 'open-uri'
require 'csv'
desc "Import iTunes coountry"
task :import_itunes_country_list => :environment do
	# company = Company.find_by_name("GOBO")
	# i = 0
	CSV.foreach('itunes_country.csv') do |row|
		unless row[1].nil?
			country = Country.new
			country.country_code = row[0]
			country.country_label = row[1]
			country.save
		end
	end	
	p "finish importing country"

end

