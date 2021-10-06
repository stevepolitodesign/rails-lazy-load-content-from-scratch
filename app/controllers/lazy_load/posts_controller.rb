class LazyLoad::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
    render partial: "lazy_load/posts/post", collection: @posts
  end

  def show
    render partial: "lazy_load/posts/post", locals: { post: @post }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
