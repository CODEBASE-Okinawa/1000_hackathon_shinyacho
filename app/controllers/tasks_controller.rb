class TasksController < ApplicationController
  def new
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_list_path(@task.task_list_id)
    else
      @tasks = Task.all
      redirect_to task_list_path(task_params["task_list_id"])
    end
  end

  def show
    @task = Task.find(params[:id])
    @comments = Comment.all.where(task_id: params[:id])
    @comment = Comment.new
  end

  def update
    task = Task.find(params[:id])
    task.closed = !task.closed
    task.save
    task_list_id = task.task_list_id
    redirect_to("/task_lists/#{task_list_id}")
  end

  private

  def task_params
    params.require(:task).permit(:content, :closed, :task_list_id)
  end
end
