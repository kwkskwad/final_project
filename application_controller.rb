require 'bundler'
Bundler.require

require_relative 'models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/results' do
    erb :results
  end

	post '/results' do
    @genre = params[:musicoption].upcase
    @results= get_data_from_soundcloud(@genre)
    @sound_cloud_link = @results.gsub(":", "%3A")
		erb :results
	end

  get '/about' do
    erb :about
  end
end