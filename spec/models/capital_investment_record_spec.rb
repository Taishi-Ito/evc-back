require 'rails_helper'

RSpec.describe CapitalInvestmentRecord, type: :model do
  before(:each) {@ci = FactoryBot.build(:capital_investment)}
  subject { @ci }

  it "capital_investment_id,year,existing_facilitiesnew_facilities,d_existing_facilities,d_new_facilities,d_yearがあれば有効である" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_valid
  end

  it "capital_investment_idがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: nil, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "yearがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: nil, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "existing_facilitiesがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: nil, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "new_facilitiesがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: nil, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_existing_facilitiesがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: nil, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_new_facilitiesがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: nil, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_yearがnilであれば無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: nil, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end


  it "yearが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: "２０１７", existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "existing_facilitiesが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: "１００００００", new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "new_facilitiesが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: "１００００００", d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_existing_facilitiesが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: "１００００００", d_new_facilities: 1000000, d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_new_facilitiesが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: "１００００００", d_year: 1, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end

  it "d_yearが全角数字の場合無効である。" do
    @cir = CapitalInvestmentRecord.new(id: 1, capital_investment: @ci, year: 2017, existing_facilities: 1000000, new_facilities: 1000000, d_existing_facilities: 1000000, d_new_facilities: 1000000, d_year: "２０１７", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@cir).to be_invalid
  end
end
