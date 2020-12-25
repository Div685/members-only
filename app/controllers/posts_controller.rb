class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :authenticate_user!, except: %i[index]

  def index
    @posts = Post.all.order('created_at DESC')
    @post = Post.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |f|
      if @post.save
        f.html { redirect_to root_path, notice: 'Post was Successfully Created' }
        f.json { render :show, status: :created, location: @post }
      else
        f.html { render :new }
        f.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was Successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :post)
  end
end
