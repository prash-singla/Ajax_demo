class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    set_post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.save
    @posts=Post.all
    
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
     "*********************updating********************** "
       @post.update(post_params)
        @posts=Post.all
   
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  
    respond_to do |format|
      if @post.destroy
        @posts=Post.all
        format.html { redirect_to posts_path}
        format.js   # renders create.js.erb, which could be used to redirect via javascript
      else
        format.html { render :action => 'new' }
        format.js { render :action => 'new' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:tittle)
    end
end