class ShortiesController < ApplicationController
  def create
    # Create the shorty from the original
    sanitized_original = params[:url]
    @shorty = Shorty.new(original: sanitized_original, shortened: Shorty.create_unique_key)
    @shorty.save
  end

  def show
    # This will grab the unique_key of the shorty and
    # redirect the user to the original url
    @shorty = Shorty.find_by_shortened(params[:unique_key])
    # Hacky way of forcing http:// for now.
    redirect_to 'http://' + @shorty.original
  end
end
