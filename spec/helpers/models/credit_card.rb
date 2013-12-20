def credit_card
  if ENV["GODADDY_ENV"] == "test"
    OpenStruct.new({
        :number => "4242424242424242",
        :expiration => "12/15",
        :verification => "123" })
  else
    OpenStruct.new({
        :number => "42421212121212",
        :expiration => "12/15",
        :verification => "123" })
  end
end