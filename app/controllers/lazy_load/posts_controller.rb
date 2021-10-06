class LazyLoad::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
    render partial: "lazy_load/posts/post", collection: @posts, layout: false
  end

  def show
    render partial: "lazy_load/posts/post", locals: { post: @post }, layout: false
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
