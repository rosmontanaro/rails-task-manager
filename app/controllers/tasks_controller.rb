class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update]

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end


  def set_task
    @task = Task.find(params[:id])
  end
end
