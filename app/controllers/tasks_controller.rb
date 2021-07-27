#Tasks Controller
class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    # Ici on met la logique pour créer le restaurant
    @task = Task.new(task_params)
    @task.save
    flash[:notice] = 'A new task was added'
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @task.save
    flash[:notice] = 'Task was updated'
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'Task was deleted'
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
