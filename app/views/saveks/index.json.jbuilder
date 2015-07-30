json.saveks @saveks do |savek|
  json.extract! savek, :id, :first_name, :last_name, :occupation, :latitude, :longitude, :radius, :avg_rating, :ratings, :gender, :address, :phone
  json.url savek_url(savek, format: :json)
end
json.next_page @last_count