class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = current_user.tasks
    @tasks = @tasks.where(status: params[:status]) if params[:status].present?
    @tasks = @tasks.where(priority: params[:priority]) if params[:priority].present?
    @tasks = @tasks.by_category(params[:category_id]) if params[:category_id].present?
    
    # Búsqueda
    if params[:search].present?
      @tasks = @tasks.where("title ILIKE ? OR description ILIKE ?", 
                           "%#{params[:search]}%", "%#{params[:search]}%")
    end
    
    # Paginación
    @tasks = @tasks.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    
    if @task.save
      redirect_to tasks_path, notice: '¡Tarea creada exitosamente!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: '¡Tarea actualizada exitosamente!'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: '¡Tarea eliminada exitosamente!'
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :priority, :category_id)
  end
end
