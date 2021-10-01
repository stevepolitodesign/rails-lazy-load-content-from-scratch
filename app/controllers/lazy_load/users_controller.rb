class LazyLoad::UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "lazy_load/users/user", collection: @users, formats: [:html]) } }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "lazy_load/users/user", locals: { user: @user }, formats: [:html]) } }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
