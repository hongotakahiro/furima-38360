FactoryBot.define do
  factory :user do
    nickname { 'あ' }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { 'あ' }
    first_name            { 'あ' }
    family_name_kana      { 'ア' }
    first_name_kana       { 'ア' }
    date_of_birth         { '1931-02-04' }
  end
end
