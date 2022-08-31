class ProjectsController < ApplicationController
  def index
    work_group_project_lists = Project.get_wg_pj_lists current_user.id
    if work_group_project_lists
      render json: {work_group_project_lists: work_group_project_lists}, status: 200
    else
      render json: {message: "ワークグループを取得できませんでした。"}, status: 404
    end
  end
end
