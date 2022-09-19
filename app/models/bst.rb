class Bst < ApplicationRecord
  belongs_to :project
  has_many :bst_record, dependent: :destroy
  serialize :sequence
  validates :unit, presence: true
  validates :fixed, presence: true

  def records
    bst_records = BstRecord.where(bst_id: self.id)
    records = self.sequence.map do |num|
      bst_records.find(num)
    end

    if records.length > 0
      records = records.map do |record|
        hash = {
          record_id: record.id,
          bst: record.bst_id,
          year: record.year,
          month: record.month,
          cash: record.cash,
          accounts_receivable: record.accounts_receivable,
          ar_sales_ratio: record.ar_sales_ratio,
          merchandise_other: record.merchandise_other,
          mo_sales_ratio: record.mo_sales_ratio,
          investment_other: record.investment_other,
          land_buildings: record.land_buildings,
          accounts_payable: record.accounts_payable,
          cost_ratio: record.cost_ratio,
          cd_other: record.cd_other,
          long_term_debt: record.long_term_debt,
          fl_other: record.fl_other,
          capital: record.capital,
          surplus: record.surplus
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
    bst_record = BstRecord.where(bst_id: self.id)
    if bst_record.size == 0
      create_bst_record
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
  def create_bst_record
    create_bst_record = BstRecord.create!(
      bst_id: self.id,
      year: 0, month: 0, cash: 0, accounts_receivable: 0, ar_sales_ratio: 0, merchandise_other: 0, mo_sales_ratio: 0, land_buildings: 0,
      investment_other: 0, accounts_payable: 0, cost_ratio: 0, cd_other: 0, long_term_debt: 0, fl_other: 0, capital: 0, surplus: 0
    )
    self.sequence << create_bst_record.id
  end
end
