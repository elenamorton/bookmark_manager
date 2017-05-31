require 'sinatra/base'
require_relative 'models/link'


class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'link/index'
  end


end
