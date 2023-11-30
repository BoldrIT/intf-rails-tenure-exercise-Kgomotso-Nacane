require "test_helper"

class InstitutionTest < ActiveSupport::TestCase
  describe "Institution" do
    let(:klazz) { Institution }

    let(:fixture_names) {
      %i[
        institution1
        institution2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = institutions(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
