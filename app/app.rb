require 'sinatra/base'
require_relative 'models/link'


class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  run! if app_file == $0
end


DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

DataMapper.finalize
DataMapper.auto_upgrade!
