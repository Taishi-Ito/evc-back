require 'rails_helper'

RSpec.describe CfRecord, type: :model do
  before(:each) {@cf = FactoryBot.build(:cf)}
  subject { @cf }

  it "cf,year,payout_ratio,dividendがある場合有効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: 2017, payout_ratio: 60, dividend: 1000000)
    expect(@cfr).to be_valid
  end

  it "cfがない場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: nil, year: 2017, payout_ratio: 60, dividend: 1000000)
    expect(@cfr).to be_invalid
  end

  it "yearがない場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: nil, payout_ratio: 60, dividend: 1000000)
    expect(@cfr).to be_invalid
  end

  it "payout_ratioがない場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: 2017, payout_ratio: nil, dividend: 1000000)
    expect(@cfr).to be_invalid
  end

  it "dividendがない場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: 2017, payout_ratio: 60, dividend: nil)
    expect(@cfr).to be_invalid
  end

  it "yearが全角数字の場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: "２０１７", payout_ratio: 60, dividend: 1000000)
    expect(@cfr).to be_invalid
  end

  it "payout_ratioが全角数字の場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: 2017, payout_ratio: "１００００００", dividend: 1000000)
    expect(@cfr).to be_invalid
  end

  it "dividendが全角数字の場合無効である" do
    @cfr = CfRecord.new(id: 1, cf: @cf, year: 2017, payout_ratio: 60, dividend: "１００００００")
    expect(@cfr).to be_invalid
  end
end
