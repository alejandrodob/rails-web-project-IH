class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]
  before_action :set_movie, only: [:index, :new, :create, :destroy]

  def index
    @comments = @movie.comments
  end

  def show
  end

  def new
    @comment = @movie.comments.build
  end

  def create
    @comment = @movie.comments.build comment_params

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @movie }
      format.json { head :no_content }
    end
  end




  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
 
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
