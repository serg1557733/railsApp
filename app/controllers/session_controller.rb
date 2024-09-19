class SessionController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session).permit(:email, :password)
    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end
end
