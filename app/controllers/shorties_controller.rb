class ShortiesController < ApplicationController

  # attr_reader :unique_key

  def index
    @shorty = Shorty.new
  end

  def create
    @shorty = Shorty.new(shorty_params)
    respond_to do |format|
      if @shorty.save
        # @unique_key = @shorty.unique_key
        format.js   { }
        #  fall back for Safari
        format.html { redirect_to root_path, success: "Shorty created! ---- #{root_url + @shorty.unique_key}" }
      else
        format.js   { }
        #  fall back for Safari
        format.html { redirect_to root_path, alert: "Sorry, there was an error with your submission. Please try again." }
      end
    end
  end

  def show
    # This will grab the unique_key of the shorty and
    # redirect the user to the original url
    # @shorty = Shorty.find_by_shortened(params[:unique_key])
    # balls = decode_key
    unique_key_id = decode_key
    @shorty = Shorty.find_by(id: unique_key_id[0])
    if @shorty.nil?
      # Need to add a flash
      flash[:alert] = "Sorry, but #{root_url + params[:unique_key]} wasn't found."
      redirect_to root_path
    else
      Thread.new do
        # Increment the use count by one for each visit.
        @shorty.increment!(:use_count)
        ActiveRecord::Base.connection.close
      end
      # Permanent redirect
      flash[:success] = "Success! Redirecting now."
      redirect_to @shorty.original, status: 301
    end
  end

  private

  def shorty_params
    params.require(:shorty).permit(:original)
  end

  def decode_key
    key = params[:unique_key]
    hashid = Hashids.new('I love short urls')
    decoded_key = hashid.decode(key)
  end
end
