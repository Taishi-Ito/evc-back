require 'rails_helper'

RSpec.describe User, type: :model do
  it "uid、name、localeがあれば有効であること" do
    @user = User.new(uid: "testuid", name: "テスト太郎", locale: "ja")
    expect(@user).to be_valid
  end

  it "uidがなければ無効であること" do
    @user = User.new(uid: nil, name: "テスト太郎", locale: "ja")
    expect(@user).to be_invalid
  end

  it "nameがなければ無効であること" do
    @user = User.new(uid: "testuid", name: nil, locale: "ja")
    expect(@user).to be_invalid
  end

  it "localeがなければ無効であること" do
    @user = User.new(uid: "testuid", name: "テスト太郎", locale: nil)
    expect(@user).to be_invalid
  end
end
