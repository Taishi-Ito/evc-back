class CapitalInvestmentRecordsController < ApplicationController
  # firebaseauthが不安定なため一時スキップ
  # skip_before_action :authenticate_user
  def create
    capital_investment_record = CapitalInvestmentRecord.create!(
      capital_investment_id: capital_investment_record_params["capital_investment_id"],
      year: 0, month: 0, existing_facilities: 0, new_facilities: 0, d_existing_facilities: 0, d_new_facilities: 0, d_year: 0
    )
    capital_investment = CapitalInvestment.find(capital_investment_record_params["capital_investment_id"])
    capital_investment.reorder(capital_investment_record_params["type"], capital_investment_record_params["record_id"], capital_investment_record.id)
    if capital_investment.save
      records = capital_investment.records
      render json: {capital_investments: records}, status: 200
    else
      render json: {message: "設備投資のレコードを追加できませんでした。"}, status: 404
    end
  end

  def update
    if capital_investment_record = CapitalInvestmentRecord.find(params["id"])
      capital_investment_record.update!("#{capital_investment_record_params["row"]}": capital_investment_record_params["content"])
      render json: {year: capital_investment_record.year, row: capital_investment_record_params["row"], content: capital_investment_record["#{capital_investment_record_params["row"]}"], record_id: capital_investment_record.id}
    else
      render json: {message: capital_investment_record.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if capital_investment_record = CapitalInvestmentRecord.find(params["id"].to_i)
      capital_investment_record.destroy!
      capital_investment = CapitalInvestment.find(params["capital_investment_id"].to_i)
      capital_investment.delete_from_sequence params["id"]
      capital_investment.check_and_create_record
      capital_investment.save!
      records = capital_investment.records
      render json: {capital_investments: records}, status: 200
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def capital_investment_record_params
    params.require(:capital_investment_record).permit(:row, :content, :capital_investment_id, :record_id, :type, :year)
  end
end
