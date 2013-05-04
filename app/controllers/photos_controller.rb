class PhotosController < ApplicationController
  skip_before_filter :authenticate_user!
  layout 'user'
  def index
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      redirect_to photos_url
    else
      render :action => 'new'
    end
  end
end
