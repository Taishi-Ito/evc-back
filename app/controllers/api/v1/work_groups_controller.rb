class Api::V1::WorkGroupsController < ApplicationController
  def index
    user = Api::V1::User.find_by(uid: params["uid"])
    work_groups = Api::V1::WorkGroup.where(api_v1_user_id: user.id)
    work_group_titles = work_groups.map {|wg| wg["title"]}
    if work_groups
      render json: {work_group_titles: work_group_titles}, status: 200
    else
      render json: {work_group_titles: nil}, status: 200
    end
  end

  def create
    user = Api::V1::User.find_by(uid: work_group_params["uid"])
    work_group = Api::V1::WorkGroup.new(title: work_group_params["title"], api_v1_user_id: user.id)
    if work_group.valid?
      work_group.save
      render json: {"id": work_group.id, "title": work_group.title}, status: 200
    else
      render json: {"message": "ワークグループが作成できませんでした。"}, status: 400
    end
  end

  private
  def work_group_params
    params.require(:work_group).permit(:title, :uid)
  end
end
