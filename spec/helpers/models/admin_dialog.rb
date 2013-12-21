require_relative 'yaml_properties_holder'

class AdminDialog

  def self.properties_file
    "spec/helpers/fixtures/admin_dialog.yml"
  end

  extend YAMLPropertiesHolder

end