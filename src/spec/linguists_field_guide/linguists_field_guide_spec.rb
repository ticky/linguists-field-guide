require "spec_helper"
require "linguist/language"

RSpec.describe LinguistsFieldGuide::Language do
  describe "#all" do
    it "contains some items" do
      languages = LinguistsFieldGuide::Language.all
      expect(languages).not_to be_nil
      expect(languages).not_to be_empty
    end

    describe "compared with Linguist::Language" do
      let(:language_variable_names) do
        %i{
          __ATTR_NAMES_GO_HERE__
        }
      end

      linguist_languages = Linguist::Language.all
      fieldguide_languages = LinguistsFieldGuide::Language.all

      it "contains the same number of items" do
        expect(linguist_languages.length).to eql(fieldguide_languages.length)
      end

      linguist_languages.each_index do |index|
        linguist_language = linguist_languages[index]
        fieldguide_language = fieldguide_languages[index]

        describe "for #{linguist_language.name}" do
          it "automatically implemented attr_readers' values match" do
            language_variable_names.each do |variable_name|
              expect(linguist_language.public_send variable_name).to eql(fieldguide_language.public_send variable_name)
            end
          end

          describe "manually implemented methods' values match" do
            it "group" do
              expect(linguist_language.group&.name).to eql(fieldguide_language.group&.name)
            end

            it "popular?" do
              expect(linguist_language.popular?).to eql(fieldguide_language.popular?)
            end

            it "searchable?" do
              expect(linguist_language.searchable?).to eql(fieldguide_language.searchable?)
            end

            it "type" do
              expect(linguist_language.type).to eql(fieldguide_language.type)
            end
          end
        end
      end
    end
  end

  describe "#find_by_name" do
    it "finds the item you expect" do
      rust_lang = LinguistsFieldGuide::Language.find_by_name "Rust"
      expect(rust_lang).not_to be_nil
      expect(rust_lang.name).to eql("Rust")
    end
  end
end
