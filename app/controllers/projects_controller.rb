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
    project = Project.create!(title: project_params["title"], work_group_id: project_params["work_group_id"], created_by: project_params["uid"])
    project.create_default_modelset current_user.uid
    render json: {"id": project.id, "title": project.title, "work_group_id": project.work_group_id}, status: 201
  end

  def update
    if project = Project.find(project_params["project_id"])
      if project.update!(title: project_params["title"])
        render json: {project_titles: project.title, project_id: project.id,work_group_id: project.work_group_id}, status: 200
      else
        render json: {message: project.errors.full_messages.join("<br>")}, status: 400
      end
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if project = Project.find(params["id"])
      project_id= project.id
      work_group_id = project.work_group_id
      project.destroy!
      render json: {work_group_id: work_group_id, project_id: project_id}, status: 200
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def search
    if params[:q].present?
      q = Project.ransack(title_cont: params[:q], user_id: current_user.id)
      results = q.result.to_a
      results.map! do |result|
        result = result.create_response
      end
      unless results.empty?
        render json: {results: results}, status: 200
      else
        render json: {results: nil}, status: 200
      end
    else
      render json: {message: "プロジェクト名を入力してください。"}, status: 404
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :uid, :work_group_id, :project_id)
  end
end
