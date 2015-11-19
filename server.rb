require "sinatra"
require "csv"

get "/articles/new" do

  erb :articles_new
end

get "/articles" do
  @articles = CSV.read("articles.csv")
  erb :articles
end

post "/articles" do
  @article = params["article_name"]
  @url = params["article_url"]
  @description = params["article_description"]
  CSV.open("articles.csv", "ab") do |file|
    file << [@article, @url, @description]
  end
  redirect "/articles"
end
