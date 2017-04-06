ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/link'
require_relative './models/user'

class BookmarkManager < Sinatra::Base

  get '/sign-up' do
    erb :'sign_up'
  end

  post '/sign-up' do
    @user = User.create(email: params[:email], password: params[:password])
    redirect to('/links')
  end

  get '/links' do
    @user = User.instance
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end
