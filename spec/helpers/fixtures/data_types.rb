def load_json_file(filename)
  file_contents = File.read("spec/helpers/fixtures/#{filename}")
  data = JSON.parse(file_contents)
  return data
end

def load_xml_file(filename)
  file_contents = File.read("spec/helpers/fixtures/#{filename}")
  Nokogiri::XML(file_contents)
end
