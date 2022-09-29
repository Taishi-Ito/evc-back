require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:each) {@user = FactoryBot.build(:user)}
  before(:each) {@wg = FactoryBot.build(:work_group)}
  subject { @user }
  subject { @wg }

  it "work_groupとtitleとcreated_byがあれば有効である" do
    @pj = Project.new(id: 1, work_group: @wg, title: "テスト", created_by: @user.uid, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@pj).to be_valid
  end

  it "work_groupがなければ無効である" do
    @pj = Project.new(id: 1, work_group: nil, title: "テスト", created_by: @user.uid, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@pj).to be_invalid
  end

  it "titleがなければ無効である" do
    @pj = Project.new(id: 1, work_group: @wg, title: nil, created_by: @user.uid, created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@pj).to be_invalid
  end

end
