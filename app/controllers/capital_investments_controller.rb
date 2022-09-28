class CapitalInvestmentsController < ApplicationController
  # firebaseauthが不安定なため一時スキップ
  # skip_before_action :authenticate_user
  def index
    capital_investment = CapitalInvestment.find_by(project_id: params["project_id"])
    if capital_investment
      records = capital_investment.records
      render json: {capital_investments: records, capital_investment_id: capital_investment.id, unit: capital_investment.unit, fixed: capital_investment.fixed}, status: 200
    else
      render json: {message: "設備投資のモデルを取得できませんでした。"}, status: 404
    end
  end

  def update
    if capital_investment = CapitalInvestment.find(params["id"])
      capital_investment.update!(unit: capital_investment_params["unit"], fixed: capital_investment_params["fixed"])
      render json: {unit: capital_investment.unit, fixed: capital_investment.fixed}
    else
      render json: {message: capital_investment.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def capital_investment_params
    params.require(:capital_investment).permit(:uid, :project_id, :unit, :fixed)
  end
end
