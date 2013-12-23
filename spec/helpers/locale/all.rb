#
# Use the local provided by the environment variable LOCALE
# and if none is specified, then default to our default testing
# locale
#
def testing_locale
  ENV["LOCALE"] || default_testing_locale
end

def default_testing_locale
  "en"
end

def locale_file(language)
  "#{File.dirname(__FILE__)}/#{language}.yml"
end

I18n.load_path.push locale_file(default_testing_locale)

#
# The `t` helper is one that is defined in Rails. We simply pass
# the key that we want to look up within our localization yml file.
#
# This saves us from having to type `I18n.t(key)` everywhere within
# our code.
#
def t(key)
  I18n.t(key)
end