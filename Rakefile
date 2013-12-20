require 'yaml'

def load_db
  YAML.load_file('database.yml')
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new "spec:features" do |task|
  task.pattern = "spec/features/**/*_spec.rb"
  task.rspec_opts = "-f p"
end

namespace "dev" do
  task "db:yml:info" do
    # db = YAML.load(File.read('database.yml'))["development"]
    db = load_db["development"]
    puts "#{db["user"]} connects to a #{db["adapter"]}"
  end
end

namespace "test" do
  task "db:yml:info" do
    data = load_db
    db = data["test"]
    puts "#{db["user"]} connects to a #{db["adapter"]}"
  end
end

# namespace "dev" do
#   namespace "db" do
#     namepace "yml" do

#       task "info" do

#       end
#     end
#   end
# end
