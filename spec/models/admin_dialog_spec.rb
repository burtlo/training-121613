require 'spec_helper'

describe AdminDialog do

  let(:subject) { AdminDialog.new }

  it "has all the methods defined in the yml file" do
    properties = YAML.load_file("spec/helpers/fixtures/admin_dialog.yml")

    properties.keys.each do |property|
      expect(subject).to respond_to(property)
    end
  end
end