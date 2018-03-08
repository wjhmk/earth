class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 12)
  end
  
  def new
    @post = Post.new
  end
  

  def create
    @post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
  end
  
  
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
  end
  
  private

  	def post_params
  		params.require(:post).permit(:name, :body)
  	end
  
end
