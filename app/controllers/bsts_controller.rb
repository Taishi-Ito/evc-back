class BstsController < ApplicationController
  def index
    bst = Bst.find_by(project_id: params["project_id"])
    if bst
      records = bst.records
      render json: {bsts: records, bst_id: bst.id, unit: bst.unit, fixed: bst.fixed}, status: 200
    else
      render json: {message: " B/Sのモデルを取得できませんでした。"}, status: 404
    end
  end

  def update
    if bst = Bst.find(params["id"])
      bst.update!(unit: bst_params["unit"], fixed: bst_params["fixed"])
      render json: {unit: bst.unit, fixed: bst.fixed}
    else
      render json: {message: bst.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def bst_params
    params.require(:bst).permit(:uid, :project_id, :unit, :fixed)
  end
end
