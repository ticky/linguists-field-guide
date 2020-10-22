require "spec_helper"

RSpec.describe LinguistsFieldGuide::Language do
  describe "#all" do
    it "contains some items" do
      languages = LinguistsFieldGuide::Language.all
      expect(languages).not_to be_nil
      expect(languages).not_to be_empty
    end
  end
end
