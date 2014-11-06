class UsersController < ApplicationController
  before_filter :user_find, only: [:update, :edit, :show]
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.errors.empty?
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:avatar, :name, :surname)
    end

    def user_find
      @user = User.find(params[:id])
    end
end
