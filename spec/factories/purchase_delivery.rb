FactoryBot.define do
  factory :purchase_delivery do
    zip_cord           { '123-4567' }
    prefecture_id      { Faker::Number.between(from: 1, to: 48) }
    city               { '横浜市緑区' }
    house_number       { '青山１１１' }
    building_name      { '' }
    phone_number       { Faker::Number.between(from: 1_111_111_111, to: 9_999_999_999) }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
