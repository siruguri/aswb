class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    # @tasks automatically set to Product.accessible_by(current_ability)
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @tasks }
    end
  end

  def new
    @task=Task.new
  end

  def create
    @task = Task.new(task_strong_params params[:task])
    @task.owner=User.find_by_id current_user.id if current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        # Let's return a 201
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        # Let's return a 422
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong params
  def task_strong_params(p)
    p.permit(:title) if params[:task]
  end
end
