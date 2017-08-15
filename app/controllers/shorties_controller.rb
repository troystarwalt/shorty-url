class ShortiesController < ApplicationController

  def index
    @shorty = Shorty.new
  end

  def create
    # Create the shorty from the original
    @shorty = Shorty.new(original: params[:shorty][:original], shortened: Shorty.create_unique_key)
    respond_to do |format|
      if @shorty.save
        format.js   { }
        format.html { redirect_to root_path, notce: "Shorty created." }
      else
        format.html { redirect_to root_path, notice: "Not going to happen." }
        format.js {}
        # format.json { render json: @shorty.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    # This will grab the unique_key of the shorty and
    # redirect the user to the original url
    @shorty = Shorty.find_by_shortened(params[:unique_key])
    if @shorty.nil?
      # Need to add a flash
      redirect_to root_path
      puts "not happening"
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
end
