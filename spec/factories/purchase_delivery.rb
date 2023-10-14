FactoryBot.define do
  factory :purchase_delivery do
    # card_number        { 4242424242424242 }
    # card_exp           { Faker::Number.between(from: 1111, to: 9999) }
    # card_cvc           { 123 }
    zip_cord           { '123-4567' }
    prefecture_id      { Faker::Number.between(from: 1, to: 48) }
    city               { '横浜市緑区' }
    house_number       { '青山１１１' }
    building_name      { '' }
    phone_number       { Faker::Number.between(from: 1111111111, to: 9999999999) }
    token              {"tok_abcdefghijk00000000000000000"}

    association :user, factory: :user, strategy: :build
    association :item, factory: :item, strategy: :build
  end
end
