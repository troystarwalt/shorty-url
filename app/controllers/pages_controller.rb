class PagesController < ApplicationController
  def index
    @shorty = Shorty.new
  end
end
