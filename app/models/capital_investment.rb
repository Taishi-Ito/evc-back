class CapitalInvestment < ApplicationRecord
  has_many :capital_investment_record, dependent: :destroy
  belongs_to :project

  def records
    records = CapitalInvestmentRecord.where(capital_investment_id: self.id).order(year: "ASC")
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
end
