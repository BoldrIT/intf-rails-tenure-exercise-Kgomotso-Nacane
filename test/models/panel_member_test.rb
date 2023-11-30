require "test_helper"

class PanelMemberTest < ActiveSupport::TestCase
  describe "PanelMember" do
    let(:klazz) { PanelMember }

    let(:fixture_names) {
      %i[
        panel1_member1
        panel2_member2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = panel_members(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
