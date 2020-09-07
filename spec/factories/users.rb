FactoryBot.define do
  factory :user do
    gimei = Gimei.new
    nickname              { Faker::Name.initials(number: 2)}
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birthday              {Faker::Date.birthday}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
