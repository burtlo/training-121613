require 'spec_helper'

describe AdminBusinessInfo do

  let(:subject) { AdminBusinessInfo.new }

  it "has all the methods defined in the properties file" do
    properties = Utils::Properties.load_from_file("spec/helpers/fixtures/admin_business_info.properties")

    properties.keys.each do |property|
      expect(subject).to respond_to(property)
    end
  end
end