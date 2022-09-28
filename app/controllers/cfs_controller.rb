class CfsController < ApplicationController
  # firebaseauthが不安定なため一時スキップ
  # skip_before_action :authenticate_user
  def index
    cf = Cf.find_by(project_id: params["project_id"])
    if cf
      records = cf.records
      render json: {cfs: records, cf_id: cf.id, unit: cf.unit, fixed: cf.fixed}, status: 200
    else
      render json: {message: " CFのモデルを取得できませんでした。"}, status: 404
    end
  end

  def update
    if cf = Cf.find(params["id"])
      cf.update!(unit: cf_params["unit"], fixed: cf_params["fixed"])
      render json: {unit: cf.unit, fixed: cf.fixed}
    else
      render json: {message: cf.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def cf_params
    params.require(:cf).permit(:uid, :project_id, :unit, :fixed)
  end
end
