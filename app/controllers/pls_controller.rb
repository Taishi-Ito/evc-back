class PlsController < ApplicationController
  # firebaseauthが不安定なため一時スキップ
  # skip_before_action :authenticate_user
  def index
    pl = Pl.find_by(project_id: params["project_id"])
    if pl
      records = pl.records
      render json: {pls: records, pl_id: pl.id, unit: pl.unit, fixed: pl.fixed}, status: 200
    else
      render json: {message: "P/Lのモデルを取得できませんでした。"}, status: 404
    end
  end

  def update
    if pl = Pl.find(params["id"])
      pl.update!(unit: pl_params["unit"], fixed: pl_params["fixed"])
      render json: {unit: pl.unit, fixed: pl.fixed}
    else
      render json: {message: pl.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def pl_params
    params.require(:pl).permit(:uid, :project_id, :unit, :fixed)
  end
end
