require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

enable :sessions

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  run! if app_file == $0
end


DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

DataMapper.finalize
DataMapper.auto_upgrade!
