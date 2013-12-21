module Capybara
  module Node
    module Actions

      #
      # Overrides the default Capybara helper `fill_in` to use
      # css selectors instead of the default Placeholder and Label Xpath
      #
      def fill_in(locator, options={})
        raise "Must pass a hash containing 'with'" if not options.is_a?(Hash) or not options.has_key?(:with)
        with = options.delete(:with)
        first(locator).set(with)
      end

    end
  end
end