class ShortiesController < ApplicationController


  def index
    @shorty = Shorty.new
  end

  def create
    @shorty = Shorty.new(shorty_params)
    respond_to do |format|
      if @shorty.save
        format.js   { }
        format.html { redirect_to root_path, notice: "Shorty created!" }
      else
        format.html { redirect_to root_path, notice: "Sorry, that's not going to happen." }
        format.js   { }
      end
    end
  end

  def show
    # This will grab the unique_key of the shorty and
    # redirect the user to the original url
    @shorty = Shorty.find_by_shortened(params[:unique_key])
    if @shorty.nil?
      # Need to add a flash
      flash[:alert] = "Not going to happen."
      redirect_to root_path
    else
      Thread.new do
        # Increment the use count by one for each visit.
        @shorty.increment!(:use_count)
        ActiveRecord::Base.connection.close
      end
      # Permanent redirect
      redirect_to @shorty.original, status: 301
    end
  end

  private

  def shorty_params
    params.require(:shorty).permit(:original)
  end
end
