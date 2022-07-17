class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to task_path(@comment.task_id)
    else
      redirect_to task_path(comment_params["task_id"])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
