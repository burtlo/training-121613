
# Workaround if you don't have Array#sample
class Array
  def sample
    at(rand(count))
  end
end
