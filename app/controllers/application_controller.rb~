class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
 
 
  def after_sign_in_path_for(resource_or_scope)
    blogs_url
  end

  def after_sign_out_path_for(resource_or_scope)
     homes_url
  end
  
  def after_sign_up_path_for(resource_or_scope)
     blogs_url
  end

  def facebook_logout
    split_token = session[:fb_token].split("|")
    fb_session_key = split_token[0]
    session[:fb_token] = nil
    redirect_to "https://www.facebook.com/logout.php?access_token=#{fb_session_key}&session_key=4fa5074f0b658c552bfe0b44117d5e37&confirm=1&next=#{destroy_user_session_url}"
    end
end
