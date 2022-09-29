FactoryBot.define do
  factory :capital_investment_record do
    id { 1 }
    capital_investment_id { 1 }
    year { 2017 }
    month { nil }
    existing_facilities { 3000000 }
    new_facilities { 3000000 }
    d_existing_facilities { 3000000 }
    d_new_facilities { 3000000 }
    d_year { 4 }
    created_at { "2022-09-01" }
    updated_at { "2022-09-01" }
  end
end
