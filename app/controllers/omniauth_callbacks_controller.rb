class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash.notice = "Signed in through Google!"
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end
  end

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Signed in through Facebook!"
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end
  end

def linkedin
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice = "Signed in through Linkedin!"
      sign_in_and_redirect @user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end
  end


end