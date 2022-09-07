class CapitalInvestment < ApplicationRecord
  has_many :capital_investment_record, dependent: :destroy
  belongs_to :project
  serialize :sequence

  def records
    ci_records = CapitalInvestmentRecord.where(capital_investment_id: self.id)
    records = self.sequence.map do |num|
      ci_records.find(num)
    end

    if records.length > 0
      records = records.map do |record|
        hash = {
          record_id: record.id,
          capital_investment: record.capital_investment_id,
          year: record.year,
          month: record.month,
          existing_facilities: record.existing_facilities.to_f,
          new_facilities: record.new_facilities.to_f,
          d_existing_facilities: record.d_existing_facilities.to_f,
          d_new_facilities: record.d_new_facilities.to_f,
          d_year: record.d_year
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
end
