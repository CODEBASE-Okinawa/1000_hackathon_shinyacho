class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to task_path(@comment.task_id)
    else
      redirect_to task_path(comment_params["task_id"])
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    # binding.pry

    if @comment.update(body: params[:comment][:body])
      redirect_to task_path(@comment.task_id)
    else
      flash.now[:danger] = "コメントが入力されていません"
      render "edit"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :task_id)
  end
end
