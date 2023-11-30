require "test_helper"

class UserTest < ActiveSupport::TestCase
  describe "User" do
    let(:klazz) { User }

    let(:fixture_names) {
      %i[
        user1
        user2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = users(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
