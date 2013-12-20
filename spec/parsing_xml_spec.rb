require 'spec_helper'

describe "Parsing XML" do

  let(:db_config) do
    load_xml_file("database.xml")
  end

  describe "development" do

    let(:env_config) do
      dev = db_config.xpath("environments/development")

      OpenStruct.new({ "adapter" => dev.xpath("adapter").text,
       "database" => dev.xpath("database").text,
       "user" => dev.xpath("user").text,
       "password" => dev.xpath("password").text })
    end

    let(:expected_env_config) do
      OpenStruct.new({ "adapter" => "mysql2",
       "database" => "pokemon-dev",
       "user" => "dev_user",
       "password" => "password" })
    end

    it "has the correct user" do
      expect(env_config.user).to(eq(expected_env_config.user))
    end

    # it_behaves_like "a correct configuration"

  end

  describe "test" do

    let(:env_config) do
      dev = db_config.xpath("environments/test")

      { "adapter" => dev.xpath("adapter").text,
       "database" => dev.xpath("database").text,
       "user" => dev.xpath("user").text,
       "password" => dev.xpath("password").text }
    end

    let(:expected_env_config) do
      { "adapter" => "mysql2",
       "database" => "pokemon-test",
       "user" => "test_user",
       "password" => "password" }
    end

    it_behaves_like "a correct configuration"

  end

end