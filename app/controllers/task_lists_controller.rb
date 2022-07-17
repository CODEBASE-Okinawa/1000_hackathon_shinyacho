class TaskListsController < ApplicationController
  def new
    @task_list = TaskList.new
    @task_lists = TaskList.all
  end

  def create
    @task_list = TaskList.new(name: params[:task_list][:name])
    if @task_list.save
      redirect_to
    else
      @task_lists = TaskList.all
      render "new"
    end
  end

  def show
    @tasks = Task.where(task_list_id: params[:id])
    @task = Task.new
  end
end
