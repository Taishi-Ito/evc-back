class Cf < ApplicationRecord
  belongs_to :project
  has_many :cf_record, dependent: :destroy
  serialize :sequence
  validates :unit, presence: true
  validates :fixed, presence: true

  def records
    cf_records = CfRecord.where(cf_id: self.id)
    records = self.sequence.map do |num|
      cf_records.find(num)
    end

    if records.length > 0
      records = records.map do |record|
        hash = {
          record_id: record.id,
          cf: record.cf_id,
          year: record.year,
          month: record.month
        }
        hash
      end
      records
    else
      return nil
    end
  end

  def reorder(type, record_id, new_record_id)
    self.sequence.each_with_index do |num, i|
      if num == record_id
        if type == "right"
          self.sequence.insert(i + 1, new_record_id)
        elsif type == "left"
          self.sequence.insert(i, new_record_id)
        end
        break
      end
    end
  end

  def check_and_create_record
    cf_record = CfRecord.where(cf_id: self.id)
    if cf_record.size == 0
      create_cf_record
    end
  end

  def delete_from_sequence id
    self.sequence.each_with_index do |num, i|
      if num == id.to_i
        self.sequence.delete_at(i)
      end
    end
  end

  private
  def create_cf_record
    create_cf_record = CfRecord.create!(
      cf_id: self.id, year: 0, month: 0
    )
    self.sequence << create_cf_record.id
  end
end
