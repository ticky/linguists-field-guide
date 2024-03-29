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
    @index = {}
    @name_index = {}

    __ATTR_READERS_GO_HERE__

    # Internal: Creates a Language object,
    # applies all the given attributes to instance variables,
    # and adds it to the `#all` list.
    # @private
    def self.create(attributes)
      language = new(attributes)

      @languages << language

      @index[language.name.downcase] = @name_index[language.name.downcase] = language
    end

    # Internal: Applies all the given attributes to instance variables.
    # @private
    def initialize(attributes)
      attributes.each do |key, value|
        instance_variable_set(key, value)
      end
    end

    # @return [Array<Language>]
    def self.all
      @languages
    end

    # Look up Language by its proper name.
    #
    # @param [String] name The proper name of a Language
    def self.find_by_name(name)
      @name_index[name&.downcase]
    end

    # Get Language group
    #
    # @return [Language] The Language group
    def group
      @group ||= if @group_name.nil?
                   self
                 else
                   Language.find_by_name(@group_name)
                 end
    end

    # Get type.
    #
    # @return [Symbol] One of the defined
    #   [`Linguist::Language::TYPES`](https://www.rubydoc.info/gems/github-linguist/Linguist/Language#TYPES-constant)
    def type
      @type.to_sym
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
