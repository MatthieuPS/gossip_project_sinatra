require 'bundler'
Bundler.require
require_relative 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/:id' do
    @id = params[:id].to_i
    @gossip = Gossip.find(@id)
    erb :gossips
  end


  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  
   
end
