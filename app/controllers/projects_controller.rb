class ProjectsController < ApplicationController
  def index
    work_group_project_lists = Project.get_wg_pj_lists current_user.id
    if work_group_project_lists
      render json: {work_group_project_lists: work_group_project_lists}, status: 200
    else
      render json: {message: "ワークグループを取得できませんでした。"}, status: 404
    end
  end

  def create
    project = Project.new(title: project_params["title"], work_group_id: project_params["work_group_id"], created_by: project_params["uid"])
    if project.valid?
      project.save
      render json: {"id": project.id, "title": project.title, "work_group_id": project.work_group_id}, status: 201
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 400
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :uid, :work_group_id)
  end
end
