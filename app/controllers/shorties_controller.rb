class ShortiesController < ApplicationController

  def create
    # Create the shorty from the original
    submitted_url = params[:url]
    @shorty = Shorty.new(original: submitted_url, shortened: Shorty.create_unique_key)
    @shorty.save
  end

  def show
    # This will grab the unique_key of the shorty and
    # redirect the user to the original url
    @shorty = Shorty.find_by_shortened(params[:unique_key])
    if @shorty.nil?
      # Need to add a flash
      redirect_to root_path
    else
      redirect_to @shorty.original
    end
  end
end
