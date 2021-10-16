class LazyLoad::PostsController < ApplicationController
  def index
    @posts = Post.all
    render partial: "lazy_load/posts/post", collection: @posts
  end
end
