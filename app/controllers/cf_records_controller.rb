class CfRecordsController < ApplicationController
  def create
    cf_record = CfRecord.create!(
      cf_id: cf_record_params["cf_id"], year: 0, month: 0
    )
    cf = Cf.find(cf_record_params["cf_id"])
    cf.reorder(cf_record_params["type"], cf_record_params["record_id"], cf_record.id)
    if cf.save
      records = cf.records
      render json: {cfs: records}, status: 200
    else
      render json: {message: "CFのレコードを追加できませんでした。"}, status: 404
    end
  end

  def update
    if cf_record = CfRecord.find(params["id"])
      updated_rows = []
      cf_record_params["rows"].each do |rows|
        updated_row = {}
        cf_record.update!("#{rows['row']}": rows["content"])
        updated_row["row"] = rows['row']
        updated_row["content"] = cf_record.send("#{rows['row']}")
        updated_rows << updated_row
      end
      render json: {year: cf_record.year, rows: updated_rows,record_id: cf_record.id}

    else
      render json: {message: cf_record.errors.full_messages.join("<br>")}, status: 404
    end
  end

  def destroy
    if cf_record = CfRecord.find(params["id"].to_i)
      cf_record.destroy!
      cf = Cf.find(params["cf_id"].to_i)
      cf.delete_from_sequence params["id"]
      cf.check_and_create_record
      cf.save!
      records = cf.records
      render json: {cfs: records}, status: 200
    else
      render json: {message: project.errors.full_messages.join("<br>")}, status: 404
    end
  end

  private
  def cf_record_params
    params.require(:cf_record).permit(:cf_id, :record_id, :type, :year, rows: [:row, :content])
  end
end
