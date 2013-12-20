require 'spec_helper'

describe "Database Configuration" do

  let(:db_config) do
    load_json_file("database.json")
  end

  describe "development environment" do

    let(:env_config) do
      db_config["development"]
    end

    let(:expected_env_config) do
      { "adapter" => "mysql2",
       "database" => "pokemon-dev",
       "user" => "dev_user",
       "password" => "password" }
    end

    it_behaves_like "a correct configuration"

  end

  describe "test environment" do

    let(:env_config) do
      db_config["test"]
    end

    let(:expected_env_config) do
      { "adapter" => "mysql2",
       "database" => "pokemon-test",
       "user" => "test_user",
       "password" => "password" }
     end

    it_behaves_like "a correct configuration"

  end

  it "production environment has the correct information" do
    result = db_config["production"]

    expected = { "adapter" => "mysql2",
                 "database" => "pokemon",
                 "user" => "root",
                 "password" => "3rV2PoqRzkTU" }

    expect(result).to(eq(expected))
  end

end
