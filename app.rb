require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

# this block of code handles HTTP GET requests to the root path
get "/" do
  # fetches all records from the Restaurant model and assigns them to an instance variable
  @restaurants = Restaurant.all
  # specifies that the response should render the index.erb file in the views directory
  erb :index
end

# this block of code handles HTTP GET requests to the /restaurants/:id path where :id is placeholder for a specific restaurant id
get "/restaurants/:id" do
  # extract the value of the :id parameter from the request's URL
  id = params[:id]
  # queries the Restaurant model to find a specific restaurant with a matching id and assigns it to an instance variable
  @restaurant = Restaurant.find(id)
  # specifies that the response should render the index.erb file in the views directory
  erb :show
end

