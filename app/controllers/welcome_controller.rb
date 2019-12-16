class WelcomeController < ApplicationController
  def index
    @articles = Article.get_last_articles(3)
  end  
end
