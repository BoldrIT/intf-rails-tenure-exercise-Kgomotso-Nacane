require "test_helper"

class PanelTest < ActiveSupport::TestCase
  describe "Panel" do
    let(:klazz) { Panel }

    let(:fixture_names) {
      %i[
        panel1
        panel2
      ]
    }

    it "has valid fixtures" do
      fixture_names.each do |fixture_name|
        subject = panels(fixture_name)
        subject.validate

        value(subject.errors).must_be_empty
      end
    end
  end
end
