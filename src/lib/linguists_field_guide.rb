require 'json'

module LinguistsFieldGuide
  # Language names that are recognizable by GitHub.
  # 
  # This is a trimmed-down version of
  # [`github-linguist`'s](https://rubygems.org/gems/github-linguist)
  # [`Linguist::Language`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language)
  # class, with just enough information to use for reference.
  class Language
    @languages = []

    __ATTR_READERS_GO_HERE__

    # Internal: Creates a Language object,
    # applies all the given attributes to instance variables,
    # and adds it to the `#all` list.
    def self.create(attributes)
      language = new(attributes)

      @languages << language
    end

    # Internal: Applies all the given attributes to instance variables.
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set(key, value)
      end
    end

    # Returns an Array of Languages
    def self.all
      @languages
    end

    # Get type.
    #
    # Returns a type Symbol or nil.
    def type
      @type&.to_sym
    end

    # Is it popular?
    def popular?
      @popular
    end

    # Is it searchable?
    def searchable?
      @searchable
    end
  end

  languages = JSON.parse <<~JSON
    __JSON_DATA_GOES_HERE__
  JSON

  languages.each { |attributes| Language.create(attributes) }
end
