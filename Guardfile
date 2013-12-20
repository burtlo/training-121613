# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard :shell do
  # watch(/Downloads\/(.*).txt/) {|m| `tail #{m[0]}` }
  watch(%r{Downloads/(.*).txt}) {|m| `rake downloads:list` }
  watch(%r{Rakefile}) {|m| `rake -T` }
end

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb')  { "spec" }
end

