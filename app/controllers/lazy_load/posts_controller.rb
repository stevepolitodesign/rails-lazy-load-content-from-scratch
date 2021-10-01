class LazyLoad::PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "lazy_load/posts/post", collection: @posts, formats: [:html]) } }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "lazy_load/posts/post", locals: { post: @post }, formats: [:html]) } }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
