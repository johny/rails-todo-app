class TasksController < ApplicationController

  include TasksHelper

  before_filter :find_task, only: [:show, :edit, :update, :destroy, :complete]
  before_filter :authenticate_user!

  def index

    if params[:project_id].nil? == false
      @project = current_user.projects.find(params[:project_id])
      redirect_to project_path(@project) and return
    end

    @tasks = current_user.tasks.not_done
    @finished_tasks = current_user.tasks.finished.limit(10)

    # for new task form
    @task = Task.new
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if params[:project_id].blank? == false && (@project = current_user.projects.find params[:project_id])
      @task.project = @project
    end
    respond_to do |format|
      if @task.save
        format.html {
          flash[:notice] = "Zadanie zapisane!"
          if @project.nil?
            redirect_to tasks_path
          else
            redirect_to project_path(@project)
          end
        }
        format.js {}
      else
        format.html {
          flash.now[:error] = "Niepoprawne dane"
          @tasks = current_user.tasks.not_done
          @finished_tasks = current_user.tasks.finished.limit(10)
          render action: "index"
        }
      end
    end

  end

  def edit
  end

  def update
    @task.update_attributes(task_params)
    if @task.save
      flash[:notice] = "Zadanie zaktualizowane!"
      if @task.project.nil?
        redirect_to tasks_path
      else
        redirect_to project_path(@task.project)
      end
    else
      flash.now[:error] = "Niepoprawne dane w formularzu!"
      render action: "edit"
    end
  end

  def destroy
    @task.destroy!
    flash[:notice] = "Zadanie usunięte!"
    redirect_to :back
  end

  def complete
    @task.complete!

    flash[:notice] = completion_flash_notice
    redirect_to :back
  end

  private

    def find_task
      @task = current_user.tasks.find params[:id]
    end

    def task_params
      params.require(:task).permit(:title, :description)
    end

end
