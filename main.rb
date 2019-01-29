require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'cgi'


get '/' do
    erb :index
end

get '/movie' do
    @movie_name = HTTParty.get("http://www.omdbapi.com/?t=#{CGI.escape(params[:name])}&apikey=2f6435d9")

    if @movie_name["Response"] == "False"
        redirect "/"
    end

    @title = @movie_name["Title"]
    @poster = @movie_name["Poster"]
    @year = @movie_name["Year"]
    @ratings = @movie_name["Ratings"]
    erb :movie
end

get '/about' do
    erb :about 
end
