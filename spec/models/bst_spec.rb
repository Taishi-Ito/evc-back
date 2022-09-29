require 'rails_helper'

RSpec.describe Bst, type: :model do
  before(:each) {@pj = FactoryBot.build(:project)}
  subject { @pj }

  it "project,unit,fixedがある場合、有効である" do
    @bst = Bst.new(id: 1, project: @pj, title: "テスト", unit: "yen", fixed: 1, created_by: "testuid", edited_by: "testuid", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@bst).to be_valid
  end

  it "projectがない場合、無効である" do
    @bst = Bst.new(id: 1, project: nil, title: "テスト", unit: "yen", fixed: 1, created_by: "testuid", edited_by: "testuid", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@bst).to be_invalid
  end

  it "unitがない場合、無効である" do
    @bst = Bst.new(id: 1, project: @pj, title: "テスト", unit: nil, fixed: 1, created_by: "testuid", edited_by: "testuid", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@bst).to be_invalid
  end

  it "fixedがない場合、無効である" do
    @bst = Bst.new(id: 1, project: @pj, title: "テスト", unit: "yen", fixed: nil, created_by: "testuid", edited_by: "testuid", created_at: "2022-09-01", updated_at: "2022-09-01")
    expect(@bst).to be_invalid
  end
end
