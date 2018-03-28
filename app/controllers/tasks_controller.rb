class TasksController < ApplicationController
  before_action :load_all_tasks, only: [:index, :update]
  before_action :load_task, only: [:edit, :update, :destroy, :show]

  def new
    @task = Task.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to action: :index
    end
  end

  def update
  end

  def destroy
    if load_task.destroy
      redirect_to action: :index
    end
  end

  private

  def load_all_tasks
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit :name, :description, :deadline
  end

  def load_task
    @task = Task.find params[:id]
  end
end
