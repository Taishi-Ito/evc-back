class WorkGroupsController < ApplicationController
  # firebaseauthが不安定なため一時スキップ
  # skip_before_action :authenticate_user
  def create
    user = User.find_by(uid: work_group_params["uid"])
    work_group = WorkGroup.create!(title: work_group_params["title"], user_id: user.id)
    render json: {"id": work_group.id, "title": work_group.title}, status: 201
  end

  def update
    if work_group = WorkGroup.find(work_group_params["id"])
      if work_group.update!(title: work_group_params["title"])
        render json: {work_group_titles: work_group.title, id: work_group.id}, status: 200
      else
        render json: {message: work_group.errors.full_messages.join("<br>")}, status: 400
      end
    else
      render json: {message: work_group.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if work_group = WorkGroup.find(params["id"])
      work_group_id= work_group.id
      work_group.destroy!
      render json: {work_group_id: work_group_id}, status: 200
    else
      render json: {message: work_group.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def work_group_params
    params.require(:work_group).permit(:title, :uid, :id)
  end
end
