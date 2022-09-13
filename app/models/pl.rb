class Pl < ApplicationRecord
  belongs_to :project
  has_many :pl_record, dependent: :destroy
  serialize :sequence
  validates :unit, presence: true
  validates :fixed, presence: true

  def records
    pl_records = PlRecord.where(pl_id: self.id)
    records = self.sequence.map do |num|
      pl_records.find(num)
    end

    if records.length > 0
      records = records.map do |record|
        hash = {
          record_id: record.id,
          pl: record.pl_id,
          year: record.year,
          month: record.month,
          customer: record.customer,
          av_customer_spend: record.av_customer_spend,
          sales_cost: record.sales_cost,
          sales_cost_ratio: record.sales_cost_ratio,
          labor_cost: record.labor_cost,
          cost_other: record.cost_other,
          no_op_income: record.no_op_income,
          interest_expense: record.interest_expense,
          interest_rate: record.interest_rate,
          other: record.other,
          tax: record.tax,
          tax_rate:record.tax_rate
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
    pl_record = PlRecord.where(pl_id: self.id)
    if pl_record.size == 0
      create_pl_record
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
  def create_pl_record
    create_pl_record = PlRecord.create!(
      pl_id: self.id,
      year: 0, month: 0, customer: 0, av_customer_spend: 0, sales_cost: 0 , sales_cost_ratio: 0, labor_cost: 0, cost_other: 0,
      no_op_income: 0, interest_expense: 0, interest_rate: 0, other: 0, tax: 0, tax_rate: 0
    )
    self.sequence << create_pl_record.id
  end
end
