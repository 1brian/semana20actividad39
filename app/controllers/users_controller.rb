class UsersController < ApplicationController
  load_and_authorize_resource


  # GET /posts
  # GET /posts.json
  def index
    @user = User.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = Comment.all
  end

  # GET /posts/new
  def new
    @user = User.new
  end

  # GET /posts/1/edit
  def edit
  end


  # POST /posts
  # POST /posts.json
  def create
    @user = User.new(User_params)
    @user.user = current_user

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @user.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'



      else
        render :edit
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @User.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @User = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role)
    end

end
