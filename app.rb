require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get "/" do
  url = "recipes.csv"
  @cookbook = Cookbook.new(url)
  @recipes = @cookbook.all
  erb :index
end

get "/about" do
  erb :about
end

get "/new" do
  erb :recipe
end

post "/recipes" do

end
