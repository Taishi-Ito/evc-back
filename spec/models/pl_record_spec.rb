require 'rails_helper'

RSpec.describe PlRecord, type: :model do
  before(:each) {@pl = FactoryBot.build(:pl)}
  subject { @pl }

  it "pl,year,customer,av_customer_spend,sales_cost,sales_cost_ratio,labor_cost,cost_other,no_op_income,interest_expense,interest_rate,other,tax,tax_rateがある場合有効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_valid
  end

  it "plがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: nil, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "yearがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: nil, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "customerがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: nil, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "av_customer_spendがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: nil, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "sales_costがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: nil, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "sales_cost_ratioがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: nil, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "labor_costがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: nil, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "cost_otherがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: nil, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "no_op_incomeがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: nil, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "interest_expenseがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: nil, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "interest_rateがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: nil, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "otherがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: nil, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "taxがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: nil, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "tax_rateがない場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: nil)
    expect(@plr).to be_invalid
  end

  it "yearが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: "２０１７", customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "customerが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: "１００００", av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "av_customer_spendが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: "１００００", sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "sales_costが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: "１００００００", sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "sales_cost_ratioが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: "６０", labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "labor_costが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: "１００００００", cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "cost_otherが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: "１００００００", no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "no_op_incomeが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: "１００００００", interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "interest_expenseが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: "１００００００", interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "interest_rateが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: "６０", other: 1000000, tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "otherが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: "１００００００", tax: 1000000, tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "taxが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: "１００００００", tax_rate: 60)
    expect(@plr).to be_invalid
  end

  it "tax_rateが全角数字の場合無効である" do
    @plr = PlRecord.new(id: 1, pl: @pl, year: 2017, customer: 10000, av_customer_spend: 10000, sales_cost: 1000000, sales_cost_ratio: 60, labor_cost: 1000000, cost_other: 1000000, no_op_income: 1000000, interest_expense: 1000000, interest_rate: 60, other: 1000000, tax: 1000000, tax_rate: "６０")
    expect(@plr).to be_invalid
  end

end
