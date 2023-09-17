FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    last_name             { '林' }
    first_name            { '太郎' }
    last_name_kana        { 'ハヤシ' }
    first_name_kana       { 'タロウ' }
    birthday              { '19300101' }
  end
end
