class LazyLoad::UsersController < ApplicationController
  def index
    @users = User.all
    render partial: "lazy_load/users/user", collection: @users
  end
end
