class ProjectsController < ApplicationController

  before_filter :find_project, except: [:index, :new, :create]
  before_filter :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @tasks = @project.tasks.not_done
    @finished_tasks = @project.tasks.finished.limit(10)

    # for new task form
    @task = Task.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    @project.user = current_user
    if @project.save
      flash[:notice] = "Projekt utworzony"
      redirect_to projects_path
    else
      flash.now[:error] = "Niepoprawnie wypełniony formularz."
      render action: "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

    def find_project
      @project = current_user.projects.find params[:id]
    end

    def project_params

      params.require(:project).permit(:name, :description, :due_date)

    end

end
