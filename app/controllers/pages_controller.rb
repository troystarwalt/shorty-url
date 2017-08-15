class PagesController < ApplicationController
  def index
    @shorty = Shorty.new
    @shorties = Shorty.limit(100).order('use_count desc')
  end
end
