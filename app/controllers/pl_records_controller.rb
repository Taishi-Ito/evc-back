class PlRecordsController < ApplicationController
  def create
    pl_record = PlRecord.create!(
      pl_id: pl_record_params["pl_id"],
      year: 0, month: 0, customer: 0, av_customer_spend: 0, sales_cost: 0 , sales_cost_ratio: 0, labor_cost: 0, cost_other: 0,
      no_op_income: 0, interest_expense: 0, interest_rate: 0, other: 0, tax: 0, tax_rate: 0
    )
    pl = Pl.find(pl_record_params["pl_id"])
    pl.reorder(pl_record_params["type"], pl_record_params["record_id"], pl_record.id)
    if pl.save
      records = pl.records
      render json: {pls: records}, status: 200
    else
      render json: {message: "設備投資のレコードを追加できませんでした。"}, status: 404
    end
  end

  def update
    if pl_record = PlRecord.find(params["id"])
      pl_record.update!("#{pl_record_params["row"]}": pl_record_params["content"])
      render json: {year: pl_record.year, row: pl_record_params["row"], content: pl_record["#{pl_record_params["row"]}"], record_id: pl_record.id}
    else
      render json: {message: pl_record.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if pl_record = PlRecord.find(params["id"].to_i)
      pl_record.destroy!
      pl = Pl.find(params["pl_id"].to_i)
      pl.delete_from_sequence params["id"]
      pl.check_and_create_record
      pl.save!
      records = pl.records
      render json: {pls: records}, status: 200
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def pl_record_params
    params.require(:pl_record).permit(:row, :content, :pl_id, :record_id, :type, :year)
  end
end
