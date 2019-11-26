class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order("updated_at desc").page(params[:page])
  end

  # GET /posts/0
  # GET /posts/0.json
  def show
    if params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      @comments_belongs_to_post = Comment.where(:post=> @post)
      if @comment.user != current_user
        flash[:alert] = "접근할 수 있는 권한이 없습니다."
        redirect_to posts_path
      end
    else
      @comment = Comment.new
      @comments_belongs_to_post = Comment.where(:post=> @post)
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if @post.user_id.to_s == current_user.id.to_s 
      render "edit"
    else
      flash[:alert] = "접근할 수 있는 권한이 없습니다."
      redirect_to profile_userdetail_path
    end
  end

  # POST /orders
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        NotificationMailer.with(post: @post).notification_mail.deliver_now
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.user_id.to_s == current_user.id.to_s
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "접근할수있는 권한이 없습니다"
      redirect_to root_path
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user_id.to_s == current_user.id.to_s
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "접근할수있는 권한이 없습니다"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
