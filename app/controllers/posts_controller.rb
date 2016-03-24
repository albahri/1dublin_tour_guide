class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  # GET /guide/1/posts
  def index
    #find the guide for the id provided
    @guide = Guide.find(params[:guide_id])
    #Get all the posts associated with this guide
    @posts = @guide.posts 
  end

  # GET /posts/1
  # GET /posts/1.json
  # GET /blogs/1/posts/2
  def show
    @guide = Guide.find(params[:guide_id])
    # Fill an post in guides 1 that has id=2
    @post = @guide.posts.find(params[:id])
  end

  # GET /posts/new
    # GET /guides/1/posts/new
  def new
    @guide = Guide.find(params[:guide_id])
    # Associate an post object with the guide
    @post = @guide.posts.build
  end

  # GET /posts/1/edit
  # GET /guides/1/posts/2/edit
  def edit
    @guide = Guide.find(params[:guide_id])
    @post = @guide.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  # POST /guide/1/posts
  def create
    @guide = Guide.find(params[:guide_id])
    @post = @guide.posts.build(posts_params)if @post.save
    #Post saved, redirect to guide page
    redirect_to guide_post_url(@guide, @post)
  else
    render :action => "new"
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  # PUT /guides/1/posts/2
  def update
  @guide = Guide.find(params[:guide_id])
  @post = Post.find(params[:id])
  if 
    @post.update_attributes(posts_params)
    #Post saved, redirect
    redirect_to guide_post_url(@guide, @post)
  else
    render :action =>"edit"
  
  end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  # DELETE /guide/1/posts/2
  def destroy
    @guide = Guide.find(params[:guide_id])
    @post = Post.find(params[:id])
    @post.destroy
    respond_to go |format|
    format.html {redirect_to guide_posts_path(@guide) }
    format.xml {head :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post_message, :guide_id)
    end

