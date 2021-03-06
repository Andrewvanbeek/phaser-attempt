class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else
      @errors = "Invalid login info"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

