FactoryBot.define do
    factory :user do
        # nickname              {Faker::Name.initials(number: 2)}
        # email                 {Faker::Internet.free_email}
        # password              {'1a' + Faker::Internet.password}
        # password_confirmation {password}
        # family_name           {"山田"}
        # first_name            {"太郎"}
        # family_name_kana      {"ヤマダ"}
        # first_name_kana       {"タロウ"}
        # date_of_birth         {"1930-01-31"}


        nickname              {"あ"}
        email                 {Faker::Internet.free_email}
        password              {'1a' + Faker::Internet.password}
        password_confirmation {password}
        family_name           {"あ"}
        first_name            {"あ"}
        family_name_kana      {"ア"}
        first_name_kana       {"ア"}
        date_of_birth         {"1931-02-04"}


    end
  end