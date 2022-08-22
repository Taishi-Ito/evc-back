class WorkGroupsController < ApplicationController
  def index
    user = User.find_by(uid: params["uid"])
    work_groups = WorkGroup.where(user_id: user.id)
    if work_groups
      work_group_titles = work_groups.map {|wg| wg["title"]}
      render json: {work_group_titles: work_group_titles}, status: 200
    else
      render json: {work_group_titles: nil}, status: 200
    end
  end

  def create
    user = User.find_by(uid: work_group_params["uid"])
    work_group = WorkGroup.new(title: work_group_params["title"], user_id: user.id)
    if work_group.valid?
      work_group.save
      render json: {"id": work_group.id, "title": work_group.title}, status: 200
    else
      render json: {message: "送信した値が不正です。"}, status: 400
    end
  end

  private
  def work_group_params
    params.require(:work_group).permit(:title, :uid)
  end
end
