class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def tag
    posts = Post.find_by_tags([ params[:tag] ])
    render json: posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, tags: [])
  end
end
