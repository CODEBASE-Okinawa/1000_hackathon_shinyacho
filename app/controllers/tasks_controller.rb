class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to index_url
    else
      render "index"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to index_url
    else
      render "index"
    end
  end

  private

  def task_params
    params.require(:task).permit(:content, :closed)
  end
end
