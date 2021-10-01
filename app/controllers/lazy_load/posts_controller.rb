class LazyLoad::PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: { html: render_to_string(partial: "lazy_load/posts/post", collection: @posts, formats: [:html]) } }
    end
  end

  def show
  end
end
