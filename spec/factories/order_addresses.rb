FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'どこどこ'}
    address {'そこそこ'}
    building {'なになに'}
    tel_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
