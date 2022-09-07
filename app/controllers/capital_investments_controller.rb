class CapitalInvestmentsController < ApplicationController
  def index
    capital_investment = CapitalInvestment.find_by(project_id: params["project_id"])
    if capital_investment
      records = capital_investment.records
      render json: {capital_investments: records}, status: 200
    else
      render json: {message: "設備投資のモデルを取得できませんでした。"}, status: 404
    end
  end

  private
  def capital_investment_params
    params.require(:capital_investment).permit(:uid, :project_id)
  end
end
