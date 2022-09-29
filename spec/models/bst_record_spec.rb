require 'rails_helper'

RSpec.describe BstRecord, type: :model do
  before(:each) {@bst = FactoryBot.build(:bst)}
  subject { @bst }

  it "bst,year,cash,accounts_receivable,ar_sales_ratio,merchandise_other,mo_sales_ratio,investment_other,accounts_payable,cost_ratio,cd_other,long_term_debt,fl_other,capital,surplusがある時有効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_valid
  end

  it "bstがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: nil, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "yearがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: nil, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cashがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: nil, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "accounts_receivableがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: nil, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "ar_sales_ratioがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: nil, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "merchandise_otherがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: nil, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "mo_sales_ratioがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: nil, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "investment_otherがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: nil, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "accounts_payableがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: nil, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cost_ratioがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: nil, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cd_otherがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: nil, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "long_term_debtがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: nil, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "fl_otherがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: nil, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "capitalがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: nil, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "surplusがnilの時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: nil)
    expect(@bstr).to be_invalid
  end




  it "yearが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: "２０１７", cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cashが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: "１００００００", accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "accounts_receivableが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: "１００００００", ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "ar_sales_ratioが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: "６０", merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "merchandise_otherが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: "１００００００", mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "mo_sales_ratioが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: "６０", investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "investment_otherが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: "１００００００", accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "accounts_payableが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: "１００００００", cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cost_ratioが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: "６０", cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "cd_otherが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: "１００００００", long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "long_term_debtが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: "１００００００", fl_other: 1000000, capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "fl_otherが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: "１００００００", capital: 1000000, surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "capitalが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: "１００００００", surplus: 1000000)
    expect(@bstr).to be_invalid
  end

  it "surplusが半角数字の時無効である" do
    @bstr = BstRecord.new(id: 1, bst: @bst, year: 2017, cash: 1000000, accounts_receivable: 1000000, ar_sales_ratio: 60, merchandise_other: 1000000, mo_sales_ratio: 60, investment_other: 1000000, accounts_payable: 1000000, cost_ratio: 60, cd_other: 1000000, long_term_debt: 1000000, fl_other: 1000000, capital: 1000000, surplus: "１００００００")
    expect(@bstr).to be_invalid
  end
end
