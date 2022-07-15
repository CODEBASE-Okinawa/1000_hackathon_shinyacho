class TasksController < ApplicationController
  def new
    @task = Task.new
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to new_task_url
    else
      render "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to new_task_url
    else
      render "new"
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :closed)
  end
end
