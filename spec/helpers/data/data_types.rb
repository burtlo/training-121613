def load_json_file(filename)
  file_contents = File.read(filename)
  data = JSON.parse(file_contents)
  return data
end

def load_xml_file(filename)
  file_contents = File.read("database.xml")
  Nokogiri::XML(file_contents)
end
