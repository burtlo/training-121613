require 'spec_helper'

describe AdminCategories do

  let(:subject) { AdminCategories.new }

  it "has all the methods defined in the properties file" do
    properties = Utils::Properties.load_from_file("spec/helpers/fixtures/admin_categories.properties")

    properties.keys.each do |property|
      expect(subject).to respond_to(property)
    end
  end
end