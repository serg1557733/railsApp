class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email )
    @user = User.new(user_params)
    @session = session.to_hash
    if @user.save
      redirect_to root_path , notice: "Thanks for signing up!"
    else
      render :new, status: :unprocessable_entity
    end

  end

end
