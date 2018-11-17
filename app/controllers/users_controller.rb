class UsersController < ApplicationController

    def new
        @user = User.new
      end

    def create
        @user = User.new user_params
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path, notice: 'Thank you for signing up!'
        else
          render :new
        end
    end

    def destroy
      session[:user_id] = nil
  
      flash[:success] = "Signed out!"
      redirect_to root_path
    end
    
    private

  def user_params
    params.require(:user).permit(
      :nickname,                                      
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end