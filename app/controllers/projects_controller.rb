class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_comment, :change_status]

  
  def index
  	@projects = Project.order(created_at: :desc)
  end	

  def show
    @comments = @project.comments.order(created_at: :desc)
  end

  def new
  	@project = Project.new
  end	

  def edit
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    puts project.inspect

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Action to add a comment
  def add_comment
    comment = params[:content]
    @project.add_comment(comment)
    redirect_to @project
  end

  def delete_comment
    @project.delete_comment(comment)
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Action to change the status
  def change_status
    status = params[:status]
    @project.change_status(status)
    redirect_to @project
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
      params.require(:project).permit(:name)
  end
end
