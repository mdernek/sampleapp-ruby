class WelcomeController < ApplicationController
  def index
    @articles = Article.get_last_articles(4)
  end  
end
