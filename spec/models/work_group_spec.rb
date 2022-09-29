require 'rails_helper'

RSpec.describe WorkGroup, type: :model do
  before(:each) {@user = FactoryBot.build(:user)}
  subject { @user }

  it "userとタイトルがあれば有効である" do
    @wg = WorkGroup.new(id: 1, user: @user, title: "テスト", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@wg).to be_valid
  end

  it "userがなければ無効である" do
    @wg = WorkGroup.new(id: 1, user: nil, title: "テスト", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@wg).to be_invalid
  end

  it "titleがなければ無効である" do
    @wg = WorkGroup.new(id: 1, user: @user, title: nil, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@wg).to be_invalid
  end
end
