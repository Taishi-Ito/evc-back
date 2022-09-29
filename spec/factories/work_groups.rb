FactoryBot.define do
  factory :work_group do
    id { 1 }
    user_id { 1 }
    title { "テスト" }
    created_at { "2022-09-01" }
    updated_at { "2022-09-01" }
  end
end
