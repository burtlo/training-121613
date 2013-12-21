require_relative 'properties_holder'

class AdminCategories

  def self.properties_file
    "spec/helpers/fixtures/admin_categories.properties"
  end

  extend PropertiesHolder

end