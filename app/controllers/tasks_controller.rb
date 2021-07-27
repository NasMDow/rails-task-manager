# Tasks Controller
class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    flash[:notice] = 'A new task was added'
    redirect_to task_path(@task)
  end

  def edit 
  end
     
  def update
    @task.update(task_params)
    @task.save
    flash[:notice] = 'Task was updated'
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task was deleted'
    redirect_to tasks_path
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end


# <%= form_for(restaurant) do |f| %>
#  <%= f.label :name %>
#  <%= f.text_field :name %>
#  <%= f.label :address %>
#  <%= f.text_field :address %>
#  <%= f.submit %>
# <% end %>

#<!-- app/views/restaurants/new.html.erb -->
#<%= render 'form', restaurant: @restaurant %>