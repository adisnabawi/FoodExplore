class SessionsController < ApplicationController
  def new
  end
  
  def create
  user = User.find_by(email: params[:session][:email].downcase)
  if user && user.authenticate(params[:session][:password])
  #BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # Log the user in and redirect to the user's show page.
  log_in user
  redirect_to user
  else
  # Create an error message.
  flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
  render 'new'
  end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end
