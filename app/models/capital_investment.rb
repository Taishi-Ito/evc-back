class CapitalInvestment < ApplicationRecord
  has_many :capital_investment_record, dependent: :destroy
  belongs_to :project
  serialize :sequence

  def records
    capital_investment_record = CapitalInvestmentRecord.where(capital_investment_id: self.id)
    records = self.sequence.map do |num|
      capital_investment_record.find(num)
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

  def check_and_create_record
    capital_investment_record = CapitalInvestmentRecord.where(capital_investment_id: self.id)
    if capital_investment_record.size == 0
      create_capital_investment_record
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
  def create_capital_investment_record
    create_capital_investment_record = CapitalInvestmentRecord.create!(
      capital_investment_id: self.id,
      year: 0, month: 0, existing_facilities: 0, new_facilities: 0, d_existing_facilities: 0, d_new_facilities: 0, d_year: 0
    )
    self.sequence << create_capital_investment_record.id
  end
end
