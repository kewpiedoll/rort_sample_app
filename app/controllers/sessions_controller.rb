class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log in the user and redirct to user's show page
      # indenting below for comment purposes only
        reset_session
        # call the log_in method from the sessions_helper.rb
        # note: helpers are inlcuded in views automatically, but only
        #   incldued in controllers in the application controller
        #   <login user> same as <login(user)>
        log_in user 
        # same as <render 'users/show'?
        # rails converts it to <user_url(user)>
        redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
