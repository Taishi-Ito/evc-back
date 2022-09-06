class CapitalInvestmentRecordsController < ApplicationController
  def update
    if capital_investment_record = CapitalInvestmentRecord.find(params["id"])
      capital_investment_record.update!("#{capital_investment_record_params["row"]}": capital_investment_record_params["content"])
      render json: {year: capital_investment_record.year, row: capital_investment_record_params["row"], content: capital_investment_record["#{capital_investment_record_params["row"]}"]}
    else
      render json: {message: capital_investment_record.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def capital_investment_record_params
    params.require(:capital_investment_record).permit(:row, :content)
  end
end
