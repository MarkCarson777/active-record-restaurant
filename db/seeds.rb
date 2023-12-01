names = ["Restaurant A", "Restaurant B", "Restaurant C", "Restaurant D", "Restaurant E", "Restaurant F", "Restaurant G", "Restaurant H", "Restaurant I", "Restaurant J"]
cities = ["City1", "City2", "City3", "City4", "City5", "City6", "City7", "City8", "City9", "City10"]

# Restaurant.create! is an ActiveRecord method used to create a new record in the "restaurants" table
10.times do 
  Restaurant.create!(
    name: names.sample,
    city: cities.sample
  )
end
