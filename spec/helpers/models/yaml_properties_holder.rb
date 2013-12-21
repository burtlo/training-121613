
module YAMLPropertiesHolder

  def self.extended(base)
    base.properties.keys.each do |method_name|
      base.define_property(method_name)
    end
  end

  def define_property(name)
    define_method name do
      self.class.properties.get(name,true).to_s
    end
  end

  def properties
    @properties ||= YAML.load_file(properties_file)
  end

end
