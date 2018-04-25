class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'
  # GET /comments
  # GET /comments.json
  def index
    campaign = Campaign.find(params[:campaign_id])
    @comments = campaign.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    if params[:campaign_id].present?
      campaign = Campaign.find(params[:campaign_id])
      @comment = campaign.comments.new
    elsif params[:todo_id].present?
      todo = Todo.find(params[:todo_id])
      @comment = todo.comments.new
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    binding.pry
    if params[:comment][:campaign_id].present?
      campaign = Campaign.find(params[:comment][:campaign_id])
      @comment = campaign.comments.new(comment_params)
    elsif params[:comment][:todo_id].present?
      todo = Todo.find(params[:comment][:todo_id])
      @comment = todo.comments.new(comment_params)
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :user_id, :campaign_id, :todo_id)
    end
end
