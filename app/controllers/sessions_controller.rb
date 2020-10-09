class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
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
      
      # Chapter 9, final exercise, the code below was left off the explanation
      # and I got it from one of the other answers. This could not be 100% right.
      # (I've sincve figured out it's not needed by putting params... in front 
      # of log_in @user, above)
      #==code==> session[:session_token] = @user.session_token

      # rails converts "redirect_to @user" to it to <user_url(user)>
      redirect_to forwarding_url || @user
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
