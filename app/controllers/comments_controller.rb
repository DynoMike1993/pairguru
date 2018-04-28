class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render json: {
        html: render_to_string(
          partial: 'comments/comment',
          locals: { comment: @comment}
        )
      }
    else
      @movie = Movie.find @comment.movie_id
      render partial: 'comments/form', status: :bad_request
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    head :ok
  end

  private

  def comment_params
    params.require(:comment).permit(
      :content, :movie_id
    )
  end
end
