ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/links' do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @links = Link.all
    erb :'links'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(', ').each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  post '/create_user' do
    email = params[:email]
    password = params[:password]
    user = User.create(email: email, password: password)
    session[:user_id] = user.id
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links'
  end

  get '/tags' do
    @links = Link.all
    erb :'/tags'
  end

helper do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

end
