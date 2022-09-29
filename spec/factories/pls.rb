FactoryBot.define do
  factory :pl do
    id { 1 }
    project_id { 1 }
    title { "テスト" }
    unit { "yen" }
    fixed { 1 }
    created_at { "2022-09-01" }
    updated_at { "2022-09-01" }
  end
end
