class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        # log in the user and redirct to user's show page
        # indenting below for comment purposes only
        forwarding_url = session[:forwarding_url]
        reset_session
        # call the log_in method from the sessions_helper.rb
        # note: helpers are inlcuded in views automatically, but only
        #   incldued in controllers in the application controller
        #   <login user> same as <login(user)>
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        log_in @user 
        redirect_to forwarding_url || @user 
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
