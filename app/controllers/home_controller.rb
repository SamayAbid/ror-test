class HomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def header; end
end
