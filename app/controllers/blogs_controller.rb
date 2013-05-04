class BlogsController < ApplicationController
  layout 'user'
  def index
    #UserMailer.welcome_mail(current_user).deliver
  end
  
  def create
    @user = User.find(current_user.id)
    logger.info @user.inspect   
    respond_to do |format|
      format.json{render :json => @user.to_json}
    end
  end
  
end
