FactoryBot.define do
  factory :bst do
    id { 1 }
    project_id { 1 }
    title { "テスト" }
    unit { "yen" }
    fixed { 1 }
    created_by { "testuid" }
    edited_by { "testuid" }
    created_at { "2022-09-01" }
    updated_at { "2022-09-01" }
  end
end
