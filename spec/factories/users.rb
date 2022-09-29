FactoryBot.define do
  factory :user, class: User do
    id { 1 }
    uid { "testuid" }
    name { "テスト太郎" }
    locale { "ja" }
  end
end
