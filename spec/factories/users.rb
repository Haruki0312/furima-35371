FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.user_name}
    email {Faker::Internet.free_email}
    password {'test12'}
    password_confirmation {password}
    last_name {'田中'}
    first_name {'太郎'}
    last_name_kana {'タナカ'}
    first_name_kana {'タロウ'}
    birth_date {'1995-03-12'}
  end
end