class LazyLoad::UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
    render partial: "lazy_load/users/user", collection: @users
  end

  def show
    render partial: "lazy_load/users/user", locals: { user: @user }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
