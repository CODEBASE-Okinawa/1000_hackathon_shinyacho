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
    @task = Task.find(params[:id])
    if @task.closed == false && task_params == true
      @task.update(task_params)
      redirect_to new_task_url
    elsif @task.closed == true && task_params == false
      @task.update(task_params)
      redirect_to new_task_url
    else
      render "new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :closed, :task_list_id)
  end
end
