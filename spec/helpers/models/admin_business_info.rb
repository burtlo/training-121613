require_relative 'properties_holder'

class AdminBusinessInfo

  def self.properties_file
    "spec/helpers/fixtures/admin_business_info.properties"
  end

  extend PropertiesHolder

end