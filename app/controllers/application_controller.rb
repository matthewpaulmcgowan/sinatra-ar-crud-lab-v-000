require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end
  #CREATE
  get '/posts/new' do 
    erb :new 
  end
  
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    @posts=Post.all
    erb :index
  end
  #READ
  
  get '/posts' do 
    @posts=Post.all
    erb :index
  end
  
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
  
  #UPDATE
  
  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    erb :edit
  end
  
  patch '/posts/:id' do 
    @post = Post.find(params[:id])
    @post.update(name: params[:name],content: params[:content])
    erb :show
  end
  
  #delete
  
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    redirect to "/posts"
  end
end