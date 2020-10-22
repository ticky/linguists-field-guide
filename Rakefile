require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# Variable names we explicitly don't include
IGNORED_VARIABLE_NAMES = [
  # `group` is a reference to `self` if set, so it's not really useful to consumers:
  # https://github.com/github/linguist/blob/v7.11.1/lib/linguist/language.rb#L294-L302
  :@group
].freeze

# Variable names for which we do create instance variables,
# but do not create a reader automatically
IGNORED_READER_NAMES = [
  :@popular,
  :@searchable
]

# Docstrings we explicitly replace
OVERRIDDEN_DOCSTRINGS = {
  group_name: "The name of the language this language should be grouped under"
}.freeze

desc "Regenerate the lib/*.rb files"
task :regenerate do
  require 'json'
  require 'linguist/language'

  input = File.read("src/linguists_field_guide.rb")

  language_variable_names = []

  language_list = Linguist::Language.all.map do |language|
    variable_names = language.instance_variables
                     .reject! do |variable_name|
                       IGNORED_VARIABLE_NAMES.include? variable_name
                     end

    language_variable_names |= variable_names

    variable_names.to_h do |variable_name|
                    if variable_name[0] != '@'
                      throw ValueError("Unexpected instance variable name: #{variable_name}")
                    end

                    [variable_name, language.instance_variable_get(variable_name)]
                  end
  end

  output = input.sub /^(?<indentation>[ \t]*)__JSON_DATA_GOES_HERE__$/ do
    indentation = Regexp.last_match[:indentation]

    JSON.pretty_generate(language_list, indent: '  ').lines.map do |line|
      if line.strip.empty?
        ''
      else
        indentation + line
      end
    end.join
  end
  .sub /^(?<indentation>[ \t]*)__ATTR_READERS_GO_HERE__$/ do
    indentation = Regexp.last_match[:indentation]

    language_variable_names.reject! do |variable_name|
      IGNORED_READER_NAMES.include? variable_name
    end
    .map do |variable_name|
      plain_variable_name = variable_name.slice(1, variable_name.length)

      docstring = OVERRIDDEN_DOCSTRINGS[plain_variable_name.to_sym] || "See [github-linguist's documentation of `#{plain_variable_name}`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language##{plain_variable_name}-instance_method)"

      <<~CODE.chomp
        #{docstring.lines.map{ |line| "#{indentation}##{line}" }.join}
        #{indentation}attr_reader :#{plain_variable_name}
      CODE
    end.join("\n")
  end

  File.write("lib/linguists_field_guide.rb", output)
end
