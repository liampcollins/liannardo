class RegistrationsController < Devise::RegistrationsController
  def create
    #do stuff here
    
    super 

    # we have access to @user

  end

end