require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  # :id above is a placeholder, the value will be stored
  # in the params hash under the :id key
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end

post '/restaurants' do
  # the data contained in the body of the request is stored
  # in the params
  name = params[:name]
  location = params[:location]
  restaurant = Restaurant.new(name: name, address: location)
  restaurant.save
  # redirect "/" # to redirect to the homepage
  redirect "/restaurants/#{restaurant.id}"
end
