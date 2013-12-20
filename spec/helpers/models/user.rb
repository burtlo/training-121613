def fake_user
  OpenStruct.new({
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :street_address => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state_abbr,
    :zip_code => Faker::Address.zip_code,
    :email => Faker::Internet.email,
    :credit_card => credit_card
  })
end