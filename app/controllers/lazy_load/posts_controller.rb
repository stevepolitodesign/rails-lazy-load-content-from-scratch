class LazyLoad::PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: @posts.to_json }
    end
  end

  def show
  end
end
