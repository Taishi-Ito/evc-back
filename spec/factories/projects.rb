FactoryBot.define do
  factory :project do
    id { 1 }
    work_group_id { 1 }
    title { "テスト" }
    created_by { "testuid" }
    created_at { "2022-09-01" }
    updated_at { "2022-09-01" }
  end
end
