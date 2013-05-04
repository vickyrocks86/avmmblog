class Devise::OmniauthCallbacksController < DeviseController
  
  def failure
    set_flash_message :alert, :failure, :kind => failed_strategy.name.to_s.humanize, :reason => failure_message
    redirect_to after_omniauth_failure_path_for(resource_name)
  end
  def facebook
#      raise request.env["omniauth.auth"].to_yaml
      # You need to implement the method below in your model
  #    raise request.env["omniauth.auth"]["credentials"]["token"].to_yaml
#      raise params.to_yaml
      @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        session[:fb_token] = request.env["omniauth.auth"]["credentials"]["token"] if request.env["omniauth.auth"]['provider'] == 'facebook'
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

  protected
  def failed_strategy
    env["omniauth.error.strategy"]
  end

  def failure_message
    exception = env["omniauth.error"]
    error   = exception.error_reason if exception.respond_to?(:error_reason)
    error ||= exception.error        if exception.respond_to?(:error)
    error ||= env["omniauth.error.type"].to_s
    error.to_s.humanize if error
  end

  def after_omniauth_failure_path_for(scope)
    new_session_path(scope)
  end
end
