ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    p 'inside post 1', tag
    link.tags << tag
    p 'inside post 2', link.tags
    link.save
    p 'after save', link
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  run! if app_file == $0
end
