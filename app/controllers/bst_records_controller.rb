class BstRecordsController < ApplicationController
  def create
    bst_record = BstRecord.create!(
      bst_id: bst_record_params["bst_id"],
      year: 0, month: 0, cash: 0, accounts_receivable: 0, ar_sales_ratio: 0, merchandise_other: 0, mo_sales_ratio: 0, land_buildings: 0,
      investment_other: 0, accounts_payable: 0, cost_ratio: 0, cd_other: 0, long_term_debt: 0, fl_other: 0, capital: 0, surplus: 0
    )
    bst = Bst.find(bst_record_params["bst_id"])
    bst.reorder(bst_record_params["type"], bst_record_params["record_id"], bst_record.id)
    if bst.save
      records = bst.records
      render json: {bsts: records}, status: 200
    else
      render json: {message: "B/Sのレコードを追加できませんでした。"}, status: 404
    end
  end

  def update
    if bst_record = BstRecord.find(params["id"])
      updated_rows = []
      bst_record_params["rows"].each do |rows|
        updated_row = {}
        bst_record.update!("#{rows['row']}": rows["content"])
        updated_row["row"] = rows['row']
        updated_row["content"] = bst_record.send("#{rows['row']}")
        updated_rows << updated_row
      end
      render json: {year: bst_record.year, rows: updated_rows,record_id: bst_record.id}

    else
      render json: {message: bst_record.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if bst_record = BstRecord.find(params["id"].to_i)
      bst_record.destroy!
      bst = Bst.find(params["bst_id"].to_i)
      bst.delete_from_sequence params["id"]
      bst.check_and_create_record
      bst.save!
      records = bst.records
      render json: {bsts: records}, status: 200
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def bst_record_params
    params.require(:bst_record).permit(:bst_id, :record_id, :type, :year, rows: [:row, :content])
  end
end
