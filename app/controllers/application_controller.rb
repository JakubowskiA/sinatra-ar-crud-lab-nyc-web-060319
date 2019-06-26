
require_relative "../../config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/" do
    erb :index
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  #new
  get "/articles/new" do
    #@article = Article.new
    erb :new
  end

  #create
  post "/articles" do
    @article = Article.create(params[:article])
    redirect to "/articles/#{@article.id}"
    #redirect to "/articles/:id"
  end

  #show
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  #edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update
  patch "/articles/:id" do
    #binding.pry
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    # @article.save
    redirect to "/articles/#{@article.id}"
  end

  #delete
  delete "/articles/:id/delete" do #delete action
    @article = Article.find(params[:id])
    @article.delete
    redirect to "/articles"
  end
end
